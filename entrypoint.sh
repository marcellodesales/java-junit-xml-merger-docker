#!/bin/sh

if [ ! -z "${REPORT_FILE_NAME}" ] && [ ! -z "${TEST_SUITES_FILE_NAME}" ]; then

  TEST_SUITES_XSLT=/runtime/junit-testsuites-txt-report.xslt

  echo "Reporting on ${TEST_SUITES_FILE_NAME}"
  echo "Generating the report at ${REPORT_FILE_NAME}"

  if [ -f ${REPORT_FILE_NAME} ]; then
    echo "WARN: replacing report at '${REPORT_FILE_NAME}'"
    rm -f ${REPORT_FILE_NAME}
  fi

  # https://stackoverflow.com/questions/53742345/is-it-possible-to-run-the-xslt-file-through-shell-script/57375581#57375581
  xsltproc --output ${REPORT_FILE_NAME} ${TEST_SUITES_XSLT} ${TEST_SUITES_FILE_NAME}
  if [ ! -z "${PRINT_REPOT}" ]; then
    cat ${REPORT_FILE_NAME}
  fi

else
  # Get the -i param
  TESTS_DIR=$(echo $@ | awk -F"-i=" '{ print $2 }' | awk '{ print $1 }')
  MERGED_REPORT=$(echo $@ | awk -F"-o=" '{ print $2 }' | awk '{ print $1 }')
  echo "Merging reports at '${TESTS_DIR}' reports as '${MERGED_REPORT}'"
  java -jar /runtime/junit-xml-merger.jar $@
fi
