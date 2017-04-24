"use strict";
var PEG = require("./jscomments.js");
let input = `
   not bla bla /* js /* not nested comment */
   pum pum /* another comment */
   `;
var r = PEG.parse(input);
console.log(r);



