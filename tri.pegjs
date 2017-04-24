start
  = Words

Words
  = Quote
  / Text
  / EOF

Quote
  = quote: ('"' .* '"') Words {return quote.join("")}

Text
  = text: (!Quote . Words) {return text.join("")}

EOF
  = !.
