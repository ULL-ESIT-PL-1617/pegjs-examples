#!/usr/bin/env node
var PEG = require("./dot.js");

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
var inputs = ["aa\nbb\ncc", 
              "aa;bb%c", 
              "aaabbbccc",
              "aaaabbbccc" 
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



