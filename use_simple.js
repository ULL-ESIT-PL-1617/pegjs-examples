#!/usr/bin/env node 
try {
  var input = process.argv[2] || "2-3-4";
  var PEG = require("./simple.js");
  var r = PEG.parse(input);
  console.log(`result = ${r}`);
}
catch (err) {
  console.log(`${err.message} at line ${err.location.start.line} column ${err.location.start.column} offset ${err.location.start.offset}`);
}

