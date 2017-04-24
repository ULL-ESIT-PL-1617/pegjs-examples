{
  var sum = (function() {
    var sum = 0;
    var get = function() { return sum; };
    var set = function(first) { 
      sum = first; 
      return true; 
    };
    var add = function(op, p) {
      switch(op) {
          case '+':
              sum += p; 
              break;
          case '-':
              sum -= p; 
              break;
          default:
              error('"+" or "-" expected');
      }
      return true;
    };
    return {s: set, a: add, g: get };
  })();
}

sum     = first:value &{ return sum.s(first); } (op:[+-] product:value & { return sum.a(op, product); })* { return sum.g(); } 
value   = number:$[0-9]+                     { return parseInt(number,10); }
        / '(' sum:sum ')'                    { return sum; }


