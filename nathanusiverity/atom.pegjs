start =
    atom

validchar
    = [0-9a-zA-Z_?!+\-=@#$%^&*/.]

atom =
    chars:$validchar+
