types = type+

type = function / product / array / INT / CHAR

function = F LP ts:type COMMA td:type RP
            {
              return {type: 'F', input: ts, output:td} 
            }
product = x:X LP t1:type r:(COMMA type)* RP     
            { 
              r = r.map( ([_, t]) => t)
              if (x != r.length+1) console.error(
                `Error in product type expression!: X_${x} but found ${r.length+1} components`);
              return {type: 'X_'+x, t: [ t1 ].concat(r)}  
            }
array   = a:A LP t:type RP               { return {type: a[0], dimension: a[1], t: t}; }

_ = WhiteSpace*
WhiteSpace "whitespace"
  = [\t\v\f \u00A0\uFEFF]
  / Zs
Zs = [\u0020\u00A0\u1680\u180E\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200A\u202F\u205F\u3000]

CHAR  = _ 'CHAR' _ { return 'CHAR'; }
INT   = _ 'INT' _  { return 'INT'; }
F     = _ 'F' _    { return 'F'; }
LP    = _ '(' _
RP    = _ ')' _
COMMA = _ ',' _
X     = _ 'X_' n:$[0-9]+ _ { return n; }
A     = _ 'A_' n:$[0-9]+ _ { return ['A', n]; }
