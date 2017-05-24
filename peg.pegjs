grammar = rules:rule+ { return rules.join("\n"); }

rule = id:ID ARROW alt:alt alts:(OR alt)* SC
         {
           alts = alts.map(([_, a]) => a);
           let rest;
           rest  = alts.map((a) => { return a === "''"? "" : `
               else if (lh in first["${a}"]) { }
           `;
           }).join('');
           //console.log(rest);
           let trans = `
             let ${id} = function() {
               if (lh in first["${alt}"]) {
               }
               ${rest}
             };
           `;
           return trans;
         }

alt =  a:(STRING / ID)+ { return a.join(''); }

_ = $[ \t\n\r]*

ID = _ id:$[a-z]+ _ { return id; }
STRING = _ content:$("'" [^\']* "'") _ { return content; }
SC     = _ ";" _ { return ";" }
ARROW  = _ "->" _
OR     = _ "|" _ 
