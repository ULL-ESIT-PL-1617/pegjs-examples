var PEG = require('pegjs');
var assert = require('assert');
var fs = require('fs'); // for loading files

// Read file contents
var data = fs.readFileSync('scheme.pegjs', 'utf-8');
// Show the PEG grammar file
console.log(data);
// Create my parser
var parse = PEG.buildParser(data).parse;
// Do a test

var input = "(a b c)";
var r = parse(input);
console.log(r);
assert.deepEqual( r, ["a", "b", "c"] );

input = "(+ 1 (* x 3))";
r = parse(input);
console.log(r);
assert.deepEqual( r, ["+","1",["*","x","3"]] );


input = "(* n (factorial (- n 1)))";
r = parse(input);
console.log(r);
assert.deepEqual( r, ["*","n",["factorial",["-","n","1"]]] );

