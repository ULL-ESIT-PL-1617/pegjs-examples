{
  var sym = {};
}
start
  = stms:(stmt COLON)* { 
        let decl = "let "+Object.keys(sym).join(', ')+";\n\n"; 
        stms = stms.map(([st, _]) => st).join(";\n");
        return decl+stms;
      }

stmt = assign / exp

assign 
  = id:ID ASSIGN m:exp {sym[id] = true;  return `${id} = ${m}`; }

exp
  = $(primary OP exp)
  / primary

primary
  = NUMBER
  / id:ID { 
      if (!sym[id]) 
        console.error(`Variable ${id.slice(1)} not initialized at line ${location().start.line}`); 
      return id; 
    }
  / $(LEFTPAR exp RIGHTPAR)

_ = $[ \t\n\r]*
OP = $(_ [-+*/] _)
ID = _ id:[a-z]+ _ { return '$'+id; }
LEFTPAR = $(_ "(" _)
RIGHTPAR = $(_ ")"_)
COLON = $(_ ":" _)
ASSIGN = $(_ "<-" _)
NUMBER = $(_ [0-9]+ _) 
