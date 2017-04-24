"use strict";
const PEG = require("pegjs");
const grammar = `
 {
   const util = require("util");     

   var g = "visible variable"; 
   console.log("Inside Initializer! options = "+util.inspect(options)); 
 }
 start = 'a' { console.log('g = '+g); return 1; } 
       /  &  { console.log('inside predicate: g = '+g); return true; } 'b' { return 2; }
`;

console.log("GRAMMAR:\n"+grammar);

const parser = PEG.generate(grammar);

console.log("PARSING 'a'");
let r = parser.parse("a", { x: 'hello' });
console.log(r); 
console.log("PARSING 'b'");
r = parser.parse("b");
console.log(r); 

