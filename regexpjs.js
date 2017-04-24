var PEG, coffee, grammar, parser, r;

PEG = require('pegjs');

grammar = 'start = a: [aeiou\u2661]i . [^x-z] ';

parser = PEG.generate(grammar, {});
r = parser.parse('Abr');
console.log(r);

r = parser.parse('♡br');
console.log(r);

