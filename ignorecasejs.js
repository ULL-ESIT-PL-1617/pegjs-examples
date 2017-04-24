"use strict"
let r;

const PEG = require('pegjs');

const grammar = `start = a: 'a'i `;

const parser = PEG.generate(grammar);

r = parser.parse('A');
console.log(r);

parser = PEG.generate(grammar);
r = parser.parse('a');
console.log(r);

