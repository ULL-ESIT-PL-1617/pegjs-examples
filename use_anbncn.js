#!/usr/bin/env node
var PEG = require("./anbncn.js");

if (process.argv.length > 2) {
  try {
    var r = PEG.parse(process.argv[2]);
    console.log("ok "+JSON.stringify(r));
  }
  catch (e) {
    console.log("Grr...."+e);
  }
  process.exit(0);
}
var inputs = ["aabbcc", 
              "aabbc",     // error
              "aaabbbccc",
              "aaaabbbccc"  // not accepted
             ];

for(var i = 0; i < inputs.length; i++) {
  var input = inputs[i];
  try {
    var r = PEG.parse(input);
    console.log("ok "+JSON.stringify(r));
  }
  catch (e) {
    console.log("Grr...."+e);
  }
}


