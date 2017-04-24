var PEG = require ("pegjs");
var grammar = `
s = ('a' / 'b')+
`;
var parser = PEG.generate(grammar);
var input = process.argv[2] || 'abba';
console.log(parser.parse(input));
