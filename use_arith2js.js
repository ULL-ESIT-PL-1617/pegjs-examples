#!/usr/bin/env node
var PEG = require("./arith2js.js");
var input = process.argv[2] || `
a <- 4-2-1:
b <- (a+1)/a:
a+b+9:
`;
console.log(`Processing <${input}>`);
var r = PEG.parse(input);
console.log(r);
/*
 * let $a, $b;
 *
 * $a = 4-2-1;
 * $b = (a+1)/a;
 * a+b+9
 */
input = `
a <- 4-a-1:
b <- (a+1)/a:
a+b+9+c:
`;
console.log(`Processing <${input}>`);
r = PEG.parse(input);
console.log(r);
/*
  Variable a not initialized at line 2
  Variable c not initialized at line 4
  Variable c not initialized at line 4
  let $a, $b;

  $a = 4-a-1;
  $b = (a+1)/a;
  a+b+9+c
*/
