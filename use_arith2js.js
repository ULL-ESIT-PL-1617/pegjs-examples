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
