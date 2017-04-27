/* See file removeleftrecursionwithintermidateactions2.pegjs */
sum     = { var sum; } first:product &{ return sum = first; } 
              (op:[+-] product:product &{ return eval("sum "+op+"= "+product); })* 
              { return sum; } 
product = { var prod; } first:value &{ return prod = first; } 
              (op:[*/] value:value &{ return eval("prod "+op+"= "+value); })* 
              { return prod; } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }



