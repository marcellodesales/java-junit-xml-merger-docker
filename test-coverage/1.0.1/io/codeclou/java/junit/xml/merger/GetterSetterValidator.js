var clover = new Object();

// JSON: {classes : [{name, id, sl, el,  methods : [{sl, el}, ...]}, ...]}
clover.pageData = {"classes":[{"el":43,"id":141,"methods":[{"el":41,"sc":5,"sl":39}],"name":"GetterSetterValidator","sl":32}]}

// JSON: {test_ID : {"methods": [ID1, ID2, ID3...], "name" : "testXXX() void"}, ...};
clover.testTargets = {"test_11":{"methods":[{"sl":39}],"name":"testPojoGetterSetter","pass":true,"statements":[{"sl":40}]},"test_4":{"methods":[{"sl":39}],"name":"testPojoGetterSetter","pass":true,"statements":[{"sl":40}]}}

// JSON: { lines : [{tests : [testid1, testid2, testid3, ...]}, ...]};
clover.srcFileLines = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [4, 11], [4, 11], [], [], []]
