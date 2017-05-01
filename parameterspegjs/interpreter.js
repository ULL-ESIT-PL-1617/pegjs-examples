var PEG = require("./grammar.js");

PEG.symbols = {x: 5};
var r = PEG.parse("x");
console.log(r);
