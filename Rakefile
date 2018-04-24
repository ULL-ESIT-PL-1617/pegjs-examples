PEGJS = "pegjs"
task :default => :run

desc "Compile arithmetics.pegjs"
task :compile do
  sh "#{PEGJS} arithmetics.pegjs"
end

desc "Clean grammar"
task :clean do
  sh "pegjs-strip --strip-comment --clean-semantic removeleftrecursionwithintermidateactions2.pegjs"
end

desc "Compile removeleftrecursionwithintermidateactions2.pegjs"
task :leftrecint do
  sh "pegjs -d PEGStack:@ull-esit-pl/peg-stack removeleftrecursionwithintermidateactions2.pegjs"
end

desc "Run and use the parser generated from removeleftrecursionwithintermidateactions2.pegjs"
task :runleftrecint => :leftrecint do
  sh "./use_remove2.js '2*3+4*5-2*(1+1)'"
end

desc "Compile simple_reduce.pegjs"
task :leftrec do
  sh "pegjs simple_reduce.pegjs simple.js"
end

desc "Run and use the parser generated from arithmetics.pegjs"
task :run => :compile do
  sh "node main.js"
end

desc "Run and use the parser generated from arithmetics.pegjs"
task :a2js do
  sh "pegjs arith2js.pegjs"
  sh "node use_arith2js.js"
end

desc "Run and use the parser generated from arithmetics.pegjs"
task :topeg do
  sh "pegjs peg-simple.pegjs"
  sh "node use-peg-simple.js"
end

desc "Run and use the parser generated from arithmetics.pegjs"
task :grammar do
  sh "pegjs peg.pegjs"
  sh "node use_peg.js"
end

desc "Run and use the parser generated from simple_reduce.pegjs"
task :runleftrec => :leftrec do
  sh "./use_simple.js '(4-1-1)/2/2'"
end

desc "Compile arithmetics.pegjs browser version"
task :web do
  sh "#{PEGJS} -e calculator --format globals web/arithmetics.pegjs"
  sh "open web/calculatorglobal.html"
end

desc "Compile arithmetics.pegjs browser version"
task :web2 do
  sh "cd web && bower install pegjs"
  sh "open web/calculator.html"
end

desc "Compile and run anbncn"
task :anbncn do
  sh "#{PEGJS} anbncn.pegjs"
  sh "node use_anbncn.js"
end

desc "Compile and run intermedia"
task :intermedia do
  sh "#{PEGJS} intermedia.pegjs"
  sh "node main_intermedia.js"
end

desc "Compile and run pascal_comments"
task :nestedcomments do
  sh "../bin/pegjs pascal_comments.pegjs"
  sh "node use_pascal_comments.js"
end

desc "Compile and run typedesclang"
task :typedesc do
  sh "../bin/pegjs typedesclang.pegjs"
  sh "node --harmony_destructuring use_typedesclang.js"
end

desc "Compile and run typedesclang"
task :postfix do
  sh "../bin/pegjs infixtopostfix.pegjs"
  #sh "./use_infix2postfix.js"
end

