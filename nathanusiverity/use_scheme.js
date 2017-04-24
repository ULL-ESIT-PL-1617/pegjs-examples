var PEG = require("./scheme");
var r = PEG.parse("3");
console.log(JSON.stringify(r));

var r = PEG.parse("(3)");
console.log(JSON.stringify(r));

var r = PEG.parse("(+ 3)");
console.log(JSON.stringify(r));

var r = PEG.parse("(+ 3 4)");
console.log(JSON.stringify(r));

var r = PEG.parse("(+ 1 (* x 3))");
console.log(JSON.stringify(r));

var r = PEG.parse("(* n (factorial (- n 1)))");
console.log(JSON.stringify(r));

