start = wordlist

wordlist = firstWord:word r:rest _ { return [firstWord].concat(r); }

rest = (spword)* 

word = w:[a-z]+ { return w.join(''); }
    
spword = __ w:[a-z]+  { return w.join(''); }

__ "whites" = [ \t\n\r]+ 

_ = [ \t\n\r]*
