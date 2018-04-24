Este ejemplo muestra como pasar información desde el programa principal al parser generado por PEG.js
La idea es asociar atributos al objeto PEG retornado por el parser generado:
```
var PEG = require("./grammar.js");
PEG.symbols = {x: 5};
```
Guardar el objeto `Parser` en la cabecera:
```
{
    var Parser = this;
}
```
y a partir de ese momento ya es posible acceder a los atributos añadidos desde fuera:

```
start 
  = Variable

Variable
 = symbol:$([A-z_\$][A-z0-9_\$]*) { return Parser.symbols[symbol]; }
```
