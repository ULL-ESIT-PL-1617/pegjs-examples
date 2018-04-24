#!/usr/bin/env node
var parser = require('./gvsp.js');
var input = "b a c";
var r = parser.parse(input);
console.log(r);
input = "b c";
r = parser.parse(input);
console.log(r);
input = "b a";
r = parser.parse(input);
console.log(r); // error
