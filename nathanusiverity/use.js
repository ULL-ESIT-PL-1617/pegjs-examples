#!/usr/local/bin/node
var rep = '/Users/casiano/Dropbox/src/javascript/PLgrado/pegjs/';
var fs = require('fs');


var arguments = process.argv.splice(2);
//console.log(arguments);
var module = arguments[0];
var input  = arguments[1];
module = "./"+module;

/* compile grammar */
var FFI = require("node-ffi");
var libc = new FFI.Library(null, {
  "system": ["int32", ["string"]]
});
var run = libc.system;

function compile() {
    var PEG = require(module+'.js');
    //console.log(PEG);
    if (input) {
      input = input.toString().trim();
      console.log("input = "+input);
      var r = PEG.parse(input);
      console.log("result = "+JSON.stringify(r));
    }
}

fs.exists(module+".js", function(exists) {
  if (exists) {
    compile();
  } else {
    console.log("Can't find "+module+".js Compiling "+module+'.pegjs');
    run(rep+"bin/pegjs "+module+'.pegjs');
    compile();
  }
});
