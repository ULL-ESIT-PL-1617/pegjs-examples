var PEG = require("./danglingelse.js");
var r = PEG.parse("if c then if c then o else o");
console.log(JSON.stringify(r));
var r = PEG.parse("if c then o");
console.log(JSON.stringify(r));



