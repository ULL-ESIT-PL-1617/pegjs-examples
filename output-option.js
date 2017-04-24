var PEG = require("pegjs")
var grammar = `
  a = 'hello' b
  b = 'world'
`;
console.log(grammar)
var parser = PEG.generate(grammar,{ output: "source"})
console.log(parser.slice(0,200));
