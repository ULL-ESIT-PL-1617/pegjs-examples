#!/usr/bin/env node --harmony_destructuring
// #!/usr/local/bin/node --harmony_destructuring
const util = require('util');
var input = process.argv[2] || "F(X_2(INT, CHAR),CHAR) F(X_2(A_10(INT),A_5(CHAR)),CHAR)";
console.log(`Translating ${input}`);
var PEG = require("./typedesclang.js");
var r = PEG.parse(input);
console.log(`result = ${util.inspect(r, {depth: null})}`);

