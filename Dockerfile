FROM openjdk:17-jdk-alpine3.13 as unmazedboot-jdk-linker

WORKDIR /merger

RUN apk add --no-cache \
        coreutils \
        curl

RUN curl -L -o junit-xml-merger.jar https://github.com/codeclou/java-junit-xml-merger/releases/download/1.0.1/junit-xml-merger.jar

RUN JAR_FILE=junit-xml-merger.jar && \
    echo "Generating custom VM for junit-xml-merger" && \
    JDK_MODULES=$(jdeps --list-deps --ignore-missing-deps --recursive --compile-time ${JAR_FILE} | awk '{ print $1 }' | paste -s -d"," -) && \
    echo "Java Modules for custom JVM for junit-xml-merger: ${JDK_MODULES}" && \
    jlink --module-path /opt/jdk/jmods \
      --verbose \
      --add-modules ${JDK_MODULES} \
      --output /opt/jdk-custom \
      --compress 2 \
      --no-header-files \
      --no-man-pages

FROM alpine

LABEL maintainer marcello.desales@gmail.com

# For the xml report
RUN apk add --no-cache libxslt

# Copy the custom JVM (~45M)
COPY --from=unmazedboot-jdk-linker /opt/jdk-custom /opt/jdk-custom/jre

# Copy the Jar
COPY --from=unmazedboot-jdk-linker /merger/junit-xml-merger.jar /runtime/junit-xml-merger.jar

COPY junit-testsuites-txt-report.xslt /runtime
COPY entrypoint.sh /runtime

# Setting the custom JVM paths
ENV JAVA_HOME=/opt/jdk-custom/jre
ENV PATH="$PATH:$JAVA_HOME/bin"

ENTRYPOINT ["/runtime/entrypoint.sh"]
