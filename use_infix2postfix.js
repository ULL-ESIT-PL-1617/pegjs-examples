#!/usr/bin/env node --harmony_destructuring --use_strict
// #!/usr/local/bin/node --harmony_destructuring
var input = process.argv[2] || "2-3-4";
console.log(`Translating ${input}`);
var PEG = require("./infixtopostfix.js");
var r = PEG.parse(input);
console.log(`result = ${r}`);

