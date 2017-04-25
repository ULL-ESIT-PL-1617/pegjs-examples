let PEG = require ("pegjs");
let grammar1 = `
start = "b" .+ "c"
`;
try {
  let parser = PEG.generate(grammar1);
  let input = 'bdddc';
  console.log("OK: "+parser.parse(input));
}
catch(e) {
  console.log(e.message);
}

let grammar2 = `
start = "b" (!"c".)+ "c"
`;
try {
  let parser = PEG.generate(grammar2);
  let input = 'bdddc';
  console.log("OK: "+parser.parse(input));
}
catch(e) {
  console.log(e.message);
}

