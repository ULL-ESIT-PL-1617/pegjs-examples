var PEG = require("./javascript.js");
var util = require("util");
var input = process.argv[2] || "a = 5;";
console.log(`Processing <${input}>`);
var r = PEG.parse(input);
console.log(util.inspect(r, { depth: null}));

