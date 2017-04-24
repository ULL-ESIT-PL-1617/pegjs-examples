{
  var h = 0, number = 0;
}

e = NUMBER &{ h = number; return true; } r { return h; }

r = '-' NUMBER &{ h -= number; return true; } r  { return h; } / /* empty */

NUMBER = _ digits:$[0-9]+ _  { number = parseInt(digits, 10); return number; }

_ = $[ \t\n\r]*

