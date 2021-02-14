# Java JUnit XML Merger

> Merges multiple JUnit XML files into a single testsuites XML file. Simply combine your test results from different test runners.

[![](https://codeclou.github.io/java-junit-xml-merger/img/github-product-logo-java-merger.png)](https://github.com/codeclou/java-junit-xml-merger)

[![](https://codeclou.github.io/doc/badges/generated/test-coverage-100.svg?v2)](https://codeclou.github.io/java-junit-xml-merger/test-coverage/1.0.1/)
----

&nbsp;

### Is this for me?

You have multiple XML files that look like this:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<testsuite tests="23" failures="0" name="foo.BarUnitTest" time="4.20" errors="0" skipped="0">
  <!-- foo -->
</testsuite>
```

And you want a single file that looks like this:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<testsuites name="My Suite" time="6.60" tests="26" failures="0">
  <testsuite tests="23" failures="0" name="foo.BarUnitTest" time="4.20" errors="0" skipped="0">
    <!-- foo -->
  </testsuite>
  <testsuite tests="3" failures="0" name="bar.FooUnitTest" time="2.40" errors="0" skipped="0">
    <!-- bar -->
  </testsuite>
</testsuites>
```

then this is for you

----
&nbsp;

## Usage

## Docker

* Using a docker container to a local project:
  * Considering `$(pwd)/build/test-results` is a directory with `TEST-*.xml` from Junit

```console
docker run -ti -v $(pwd)/build/test-results:/test-results \
                marcellodesales/java-junit-xml-merger \ 
                   -i=/test-results/test \
                   -o=/test-results/junit-testsuites.xml 
                   -s="Super Tests Suite"
```

* Same with the provided example `docker-compose-example.yaml`

```console
$ docker-compose -f docker-compose-example.yaml up
Recreating java-junit-xml-merger-docker_java-junit-xml-merger_1 ... done
Attaching to java-junit-xml-merger-docker_java-junit-xml-merger_1
java-junit-xml-merger_1  | +-------------------------+
java-junit-xml-merger_1  | |  Java Junit Xml Merger  |
java-junit-xml-merger_1  | +-------------------------+
java-junit-xml-merger_1  | Success >> All input parameters ok
java-junit-xml-merger_1  | Success >> All files and folders ok
java-junit-xml-merger_1  | Info >> adding TEST-cash.super_.platform.service.distancematrix.ApplicationContextLoadTest.xml to TestSuites
java-junit-xml-merger_1  | Info >> adding TEST-cash.super_.platform.service.distancematrix.DistanceMatrixControllerIntegrationTests.xml to TestSuites
```

* JUnit Testsuites Text Reporting

```console
$ docker-compose -f tests.docker-compose.yaml up junit-text-tests-report
WARNING: Found orphan containers (distance-matrix-service_junit-tests-report_1, distance-matrix-service_fromJacoco2Cobertura_1, distance-matrix-service_distance-matrix-service-tests_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Recreating distance-matrix-service_junit-text-tests-report_1 ... done
Attaching to distance-matrix-service_junit-text-tests-report_1
junit-text-tests-report_1   | Reporting on /test-results/junit-testsuites.xml
junit-text-tests-report_1   | Generating the report at /test-results/junit-report.txt
junit-text-tests-report_1   | WARN: replacing report at '/test-results/junit-report.txt'
junit-text-tests-report_1   | Testsuites: Supercash
junit-text-tests-report_1   | --------- ----------- ---------
junit-text-tests-report_1   |
junit-text-tests-report_1   | Tests run: 1, Skipped: 0, Failures: 0, Errors: 0, Time elapsed: 1.766 sec
junit-text-tests-report_1   | --------- ----------- ---------
junit-text-tests-report_1   | * cash.super_.platform.service.distancematrix.ApplicationContextLoadTest
junit-text-tests-report_1   | - "[SUCCESS] Load Context Test" took 1.766
junit-text-tests-report_1   |
junit-text-tests-report_1   | Tests run: 1, Skipped: 0, Failures: 0, Errors: 0, Time elapsed: 3.555 sec
junit-text-tests-report_1   | --------- ----------- ---------
junit-text-tests-report_1   | * cash.super_.platform.service.distancematrix.DistanceMatrixControllerIntegrationTests
junit-text-tests-report_1   | - "[SUCCESS] Test Get Distance Matrix Success" took 3.555
junit-text-tests-report_1   |
junit-text-tests-report_1   | Tests run: 1, Skipped: 1, Failures: 0, Errors: 0, Time elapsed: 0.001 sec
junit-text-tests-report_1   | --------- ----------- ---------
junit-text-tests-report_1   | * cash.super_.platform.service.distancematrix.DistanceMatrixGoogleGeoAPICachedProxyServiceTests
junit-text-tests-report_1   | - "[SKIPPED] Test service to Distance Matrix Success mocking Google Geo API" took 0.001distance-matrix-service_junit-text-tests-report_1 exited with code 0
```

## Jar

With folder `src/test/resources/` containing multiple `*.xml` files in junit-xml format.
A combined result will be written to `output.xml`. The Suite name will be `My Suite`.

```
# INSTALL
curl -L -o junit-xml-merger.jar \
     https://github.com/codeclou/java-junit-xml-merger/releases/download/1.0.1/junit-xml-merger.jar

# RUN
java -jar junit-xml-merger.jar \
     -i=src/test/resources/ \
     -o=output.xml \
     -s="My Suite"
```
-----

### Demo

<p align="center"><img width="80%" src="https://codeclou.github.io/java-junit-xml-merger/img/demo.gif" /></p>
  
```console
git clone https://github.com/codeclou/java-junit-xml-merger.git src
cd src

curl -L -o junit-xml-merger.jar \
     https://github.com/codeclou/java-junit-xml-merger/releases/download/1.0.1/junit-xml-merger.jar

java -jar junit-xml-merger.jar \
     -i=src/test/resources/ \
     -o=output.xml \
     -s="My Suite"
```

----

# Docker Builds

```console
$ docker-compose build
Building java-junit-xml-merger
Step 1/13 : FROM openjdk:17-jdk-alpine3.13 as unmazedboot-jdk-linker
 ---> 76ab1ef2efdc
Step 2/13 : WORKDIR /merger
 ---> Using cache
 ---> 6d9357bad63b
Step 3/13 : RUN apk add --no-cache         coreutils         curl
 ---> Using cache
 ---> be26c6b43a97
Step 4/13 : RUN curl -L -o junit-xml-merger.jar https://github.com/codeclou/java-junit-xml-merger/releases/download/1.0.1/junit-xml-merger.jar
 ---> Using cache
 ---> 6f1735f728b9
Step 5/13 : RUN JAR_FILE=junit-xml-merger.jar &&     echo "Generating custom VM for junit-xml-merger" &&     JDK_MODULES=$(jdeps --list-deps --ignore-missing-deps --recursive --compile-time ${JAR_FILE} | awk '{ print $1 }' | paste -s -d"," -) &&     echo "Java Modules for custom JVM for junit-xml-merger: ${JDK_MODULES}" &&     jlink --module-path /opt/jdk/jmods       --verbose       --add-modules ${JDK_MODULES}       --output /opt/jdk-custom       --compress 2       --no-header-files       --no-man-pages
 ---> Using cache
 ---> a1dd0c008f45

Step 6/13 : FROM alpine
 ---> a24bb4013296
Step 7/13 : LABEL maintainer marcello.desales@gmail.com
 ---> Running in 481b7ec993fc
Removing intermediate container 481b7ec993fc
 ---> 697203b19f30
Step 8/13 : USER root
 ---> Running in 6c9763e948e3
Removing intermediate container 6c9763e948e3
 ---> cd088230554b
Step 9/13 : COPY --from=unmazedboot-jdk-linker /opt/jdk-custom /opt/jdk-custom/jre
 ---> 14ddf0ac1c94
Step 10/13 : COPY --from=unmazedboot-jdk-linker /merger/junit-xml-merger.jar /runtime/junit-xml-merger.jar
 ---> fb4805ba4a6a
Step 11/13 : ENV JAVA_HOME=/opt/jdk-custom/jre
 ---> Running in c32b7d466645
Removing intermediate container c32b7d466645
 ---> 0013f5a95757
Step 12/13 : ENV PATH="$PATH:$JAVA_HOME/bin"
 ---> Running in 4fb93510b134
Removing intermediate container 4fb93510b134
 ---> 8b9b343f8272
Step 13/13 : ENTRYPOINT ["java", "-jar", "/runtime/junit-xml-merger.jar"]
 ---> Running in 34add3885cd3
Removing intermediate container 34add3885cd3
 ---> 342cae361750

Successfully built 342cae361750
Successfully tagged marcellodesales/java-junit-xml-merger:latest
```

### License

[MIT](https://github.com/codeclou/java-junit-xml-merger/blob/master/LICENSE) © [Bernhard Grünewaldt](https://github.com/clouless)
