var clover = new Object();

// JSON: {classes : [{name, id, sl, el,  methods : [{sl, el}, ...]}, ...]}
clover.pageData = {"classes":[{"el":56,"id":195,"methods":[{"el":37,"sc":5,"sl":34},{"el":55,"sc":5,"sl":39}],"name":"TestSuitesTest","sl":33}]}

// JSON: {test_ID : {"methods": [ID1, ID2, ID3...], "name" : "testXXX() void"}, ...};
clover.testTargets = {"test_7":{"methods":[{"sl":34}],"name":"testPojoGetterSetter","pass":true,"statements":[{"sl":36}]},"test_8":{"methods":[{"sl":39}],"name":"testToXml","pass":true,"statements":[{"sl":41},{"sl":42},{"sl":43},{"sl":44},{"sl":45},{"sl":46},{"sl":47},{"sl":48},{"sl":49},{"sl":50},{"sl":51},{"sl":53},{"sl":54}]}}

// JSON: { lines : [{tests : [testid1, testid2, testid3, ...]}, ...]};
clover.srcFileLines = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [7], [], [7], [], [], [8], [], [8], [8], [8], [8], [8], [8], [8], [8], [8], [8], [8], [], [8], [8], [], []]
