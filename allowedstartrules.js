"use strict";
const util = require("util");

const PEG = require("pegjs");
const grammar = `
  a = 'hello' b
  b = 'world'
`; 
console.log(grammar);

const parser = PEG.generate(grammar,{ allowedStartRules: ['a', 'b'] });

let r = parser.parse("helloworld", { startRule: 'a' });
console.log(r); // [ 'hello', 'world' ]

r = parser.parse("helloworld")
console.log(r); // [ 'hello', 'world' ]

r =  parser.parse("world", { startRule: 'b' })
console.log(r); // 'world'

try {
  r = parser.parse("world"); // Throws an exception
}
catch(e) {
  r = e;
  console.log("Error!!!! message: "+e.message);
  console.log("Error!!!! expected: "+util.inspect(e.expected));
  console.log("Error!!!! found: "+util.inspect(e.found));
  console.log("Error!!!! location:\n"+util.inspect(e.location));
  console.log("Error!!!! name: "+e.name);
  console.log("Dumping error object:\n"+util.inspect(Object.keys(e)));
  //console.log("Dumping error object:\n"+util.inspect(e, {colors: true}));
}
//console.log(r);
/*
{ message: 'Expected "hello" but "w" found.',
  expected: [ { type: 'literal', value: 'hello', description: '"hello"' } ],
  found: 'w',
  offset: 0,
  line: 1,
  column: 1,
  name: 'SyntaxError' }
*/
