{
  var h = 0, number = 0;
}

s = e { return h; }
e = NUMBER &{ h = number; console.log(h); return true; } r
r = (MINUS NUMBER &{ h -= number; console.log(h); return true;}) r / empty
empty = &{ return true; } 

/* lexical analysis */
NUMBER = _ digits:$[0-9]+ _  { number = parseInt(digits, 10); return number; }
_ = $[ \t\n\r]*
MINUS = _ '-' _


