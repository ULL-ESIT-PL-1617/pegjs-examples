{
  var h = 0, number = 0;
}
e = NUMBER aux1 r         { return h; }
aux1 = /* empty */        { h = number; } 

r =   '-' NUMBER  aux2 r  { return h; }
    / /* empty */
aux2 = /* empty */        { h -= number; }

NUMBER = _ digits:$[0-9]+ _  { number = parseInt(digits, 10); return number; }

_ = $[ \t\n\r]*

