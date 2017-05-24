#!/usr/bin/env node
var PEG = require("./peg.js");
var input = process.argv[2] || `
a -> b 'c' | c 'b';
b -> 'b' b | '' ;
c -> 'c' c | '';
`;
console.log(`Processing <${input}>`);
var r = PEG.parse(input);
console.log(r);

