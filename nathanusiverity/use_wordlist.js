var PEG = require("./wordlist");
var r = PEG.parse("ab cd ef  ");
console.log(r);
var r = PEG.parse("ab cd ef");
console.log(r);

