"use strict"

const PEG = require('pegjs');

const grammar = `start = a:'a'i `;

let parser = PEG.generate(grammar);

let r = parser.parse('A');
console.log(r);

parser = PEG.generate(grammar);
r = parser.parse('a');
console.log(r);

