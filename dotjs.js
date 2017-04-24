var PEG = require('pegjs');

var grammar = 'start = a: ..';
var parser = PEG.generate(grammar);
var r = parser.parse('Ab');
console.log(r);
parser = PEG.generate(grammar);
r = parser.parse("\n\t");
console.log(r);

