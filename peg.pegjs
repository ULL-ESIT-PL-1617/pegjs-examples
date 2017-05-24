grammar = rule+

rule = ID ARROW alt (OR alt)* SC

alt =  (STRING / ID)+

_ = $[ \t\n\r]*

ID = _ id:$[a-z]+ _ { return id; }
STRING = _ "'" content:[^\']* "'" _ { return content; }
SC     = _ ";" _
ARROW  = _ "->" _
OR     = _ "|" _ 
