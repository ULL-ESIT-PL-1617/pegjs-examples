#!/usr/local/bin/node --harmony_destructuring

var arguments = process.argv.splice(2);
//console.log(arguments);
var module = arguments[0];
var input  = arguments[1];

var parse = require(module).parse;
console.log(`Processing <${input}>`);
var r = parse(input);
console.log(r);

