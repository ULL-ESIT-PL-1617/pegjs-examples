var PEG, coffee, grammar, parser, r;

PEG = require('pegjs');

grammar =  `
   {                             
     var util = require("util")     
     var g = "visible variable" 
     console.log("Inside Initializer! options = "+util.inspect(options))
   }                             
   start = 'a' { console.log(g); 1 } 
         / c:'c' '\\n' &   { 
                       console.log("inside predicate: g = '"+g+"' c = '"+c+"'")
                       console.log("options = "+util.inspect(options))
                       //console.log("offset = "+offset()); /* 0.10.0 removed */
                       //console.log("line = "+line());
                       //console.log("column = "+column());
                       return true;
                     } 'b' { return 2; }
`;

parser = PEG.generate(grammar, { });
r = parser.parse('a', { x: 'hello' });


r = parser.parse("c\nb", { y: 'world' });
console.log(r);

