PEG = require("./minus.js")
input = process.argv[2] || "5-1-(2-1)"
r = PEG.parse(input)
console.log(r)


