var PEG = require ("pegjs");
var grammar1 = `
start = "test" / "test ;"
`;
var parser = PEG.generate(grammar1);
var input = 'test';
console.log("OK: "+parser.parse(input));
try {
  // This input will not be accepted 
  var input = 'test ;';
  console.log(parser.parse(input));
}
catch (e) {
  console.log(e.message);
}
var grammar2 = `
start = "test" !" ;" / "test ;"
`;
var parser = PEG.generate(grammar2);
var input = 'test ;';
console.log("OK: "+parser.parse(input));
