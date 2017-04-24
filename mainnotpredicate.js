var PEG = require("./notpredicate.js");
var input = process.argv[2] || `
// one comment
// another comment 
/* a
   third comment */
`;
console.log("\n*****\n"+input+"\n*****\n");
var r = PEG.parse(input);
console.log(r);
