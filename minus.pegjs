sum    = left:number right:('-' number)* 
           { 
              s = left
              right.forEach (x)-> s -= x[1]
              s
           }
number = n:$[0-9]+           { Number n }
        / '(' sum:sum ')'    { sum }


