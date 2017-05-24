grammar = rules:rule+ { return rules.join("\n"); }

rule = id:ID ARROW alt:alt alts:(OR alt)* SC
         {
           alts = alts.map(([_, a]) => a);
           console.log(alts);
           let trans = `
             let ${id} = function() {
               if (lh in first("${alt}")) {
               }
               else
           
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
