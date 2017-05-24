grammar = r:rule+ { return r.join("\n"); }

rule = id:ID ARROW f:alt as:(OR a:alt { return "/ "+a })* SC {
           return `${id} = ${f}`+as.join("");
         }


alt =  $(STRING / ID)+

_ = $[ \t\n\r]*

ID = $(_ [a-z]+ _)
STRING = $(_ "'" [^\']* "'" _)
SC     = _ ";" _ 
ARROW  = _ "->" _ 
OR     = _ "|" _ 

