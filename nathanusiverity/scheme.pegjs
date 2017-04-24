start =
    e:expression
        { return (e instanceof Array && (e.length == 1) ? e[0] : e); }

expression = 
    atom 
  / LP el:expressionlist RP 
        { return [ el ]; }

expressionlist =
    e:expression __ el:expressionlist 
        { return [e].concat(el); }
  / expression

atom =
    chars:validchar+
        { return chars.join(""); }

validchar
    = [0-9a-zA-Z_?!+\-=@#$%^&*/.]

__ 
    = [ \t\n\r]+
_ 
    = [ \t\n\r]*

LP  = _ '('_
RP  = _ ')'_

