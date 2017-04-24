var PEG = require("./inherited2.js");
var input = process.argv[2] || "5-1-2";
var r = PEG.parse(input);
console.log(r);

