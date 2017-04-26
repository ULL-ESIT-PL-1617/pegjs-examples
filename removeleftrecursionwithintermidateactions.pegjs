/*
 * Classic example grammar, which recognizes simple arithmetic expressions like
 * "2*(3+4)". The parser generated from this grammar then computes their value.
 */

{
  var sum = 0;
  var update = function(op, value) {
    if (op == '-') sum -= value
    else if (op == '+') sum += value;
  }
}
start
  = additive

additive
  = left:multiplicative &{ sum = left; }
        (op:ADDOP right:multiplicative &{  update(op, right); })*  { return sum; }
  / multiplicative

multiplicative
  = left:primary MULTOP right:multiplicative { return left * right; }
  / primary

primary
  = integer
  / LEFTPAR additive:additive RIGHTPAR { return additive; }

/* A rule can also contain human-readable name that is used in error messages (in our example, only the integer rule has a human-readable name). */
integer "integer"
  = NUMBER

_ = $[ \t\n\r]*

ADDOP = _op:[+-]_ { return op; }
MULT = _"*"_
DIV = _"/"_
LEFTPAR = _"("_
RIGHTPAR = _")"_
NUMBER = _ digits:$[0-9]+ _ { return parseInt(digits, 10); }
