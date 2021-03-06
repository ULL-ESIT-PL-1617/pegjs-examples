var PEG, coffee, e, grammar, parser, r;

PEG = require('pegjs');

grammar = `
  a =  b 'c'
  b = 'b' / 'b' 'a'
`;

parser = PEG.generate(grammar, {});

r = parser.parse("bc");

console.log("r = " + r);

try {
  r = parser.parse("bac");
  console.log("r = " + r);
} catch (error) {
  e = error;
  console.log(e.message);
}

