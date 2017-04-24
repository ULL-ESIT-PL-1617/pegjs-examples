var PEG = require("./danglingelse2.js");
var r = PEG.parse("if c then if c then o else o");
console.log(JSON.stringify(r));



