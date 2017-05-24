/* TODO: port to pegjs */

pascalProgram = 
   program identifier programHeadingopt ; block . 


programHeading =  
   ( identifierList ) 


identifierList = 
   identifier  
   identifierList , identifier  


block =  
   block1  
   labelDeclaration ; block1  


block1 =  
   block2  
   constantDeclaration ; block2  


block2 =  
   block3  
   typeDeclaration ; block3  


block3 =  
   block4  
   variableDeclaration ; block4  


block4 =  
   block5  
   procAndFuncDeclaration ; block5  


block5 =  
   begin statementList end  


labelDeclaration =  
   label unsignedInteger  
   labelDeclaration , unsignedInteger  


constantDeclaration =  
   const  identifier = constant  
   constantDeclaration ;  identifier = constant  


typeDeclaration =  
   type  identifier = type  
   typeDeclaration ;  identifier = type  


variableDeclaration =  
   var variableidList : type  
   variableDeclaration ; variableidList : type  


variableidList =  
   identifier  
   variableidList ,  identifier  


constant =  
   integer  
   real 
   string
   constid  
   + constid 
   TADD- constid 


type =  
   simpleType  
   structuredType  
   ^ typeid  


simpleType =  
   (  identifierList )  
   constant ... constant  
   typeid  


structuredType =  
   array [ indexList ] of type  
   record fieldList end  
   set of simpleType  
   file of type  
   packed structuredType  


indexList =  
   simpleType  
   indexList , simpleType  


fieldList =  
   fixedPart  
   fixedPart ; variantPart 
   variantPart 


fixedPart =  
   recordField 
   fixedPart ; recordField 


recordField = 
   empty 
   fieldidList : type   


fieldidList =  
   identifier  
   fieldidList ,  identifier  


variantPart = 
   case tagField of variantList 


tagField = 
   typeid  
   identifier : typeid  


variantList =  
   variant 
   variantList ; variant 


variant = 
   empty 
   caseLabelList : ( fieldList )  


caseLabelList =  
   constant  
   caseLabelList , constant  


procAndFuncDeclaration =  
   procOrFunc  
   procAndFuncDeclaration ; procOrFunc 


procOrFunc =  
   procedure  identifier parametersopt ;  blockOrForward 
   function  identifier parametersopt : typeid ; blockOrForward 


blockOrForward =  
   block  
   forward  


parameters =  
   ( formalParameterList )  


formalParameterList =  
   formalParameterSection  
   formalParameterList ; formalParameterSection  


formalParameterSection =  
   parameteridList : typeid 
   var parameteridList : typeid  
   procedure identifier parametersopt 
   function identifier parametersopt : typeid 


parameteridList =  
   identifier  
   parameteridList , identifier  


statementList =  
   statement  
   statementList ; statement  


statement =  
   empty  
   variable := expression  
   begin statementList end  
   if expression then statement 
   if expression then statement else statement  
   case expression of caseList end  
   while expression do statement  
   repeat statementList until expression  
   for varid := forList do statement  
   procid  
   procid ( expressionList )  
   goto label 
   with recordVariableList do statement  
   label : statement  


variable =  
   identifier  
   variable [ subscriptList ]  
   variable . fieldid  
   variable ^  


subscriptList =  
   expression  
   subscriptList , expression  


caseList =  
   caseLabelList : statement  
   caseList ; caseLabelList : statement  


forList =  
   expression to expression  
   expression downto expression  


expressionList =  
   expression  
   expressionList , expression  


label =  
   unsignedInteger 


recordVariableList =  
   variable  
   recordVariableList , variable  


expression = 
   expression relationalOp additiveExpression 
   additiveExpression  


relationalOp = one of 
   <  <=  =  <>  =>  > 


additiveExpression = 
   additiveExpression additiveOp multiplicativeExpression 
   multiplicativeExpression  


additiveOp = one of 
   +  -  or 


multiplicativeExpression = 
   multiplicativeExpression multiplicativeOp unaryExpression 
   unaryExpression  


multiplicativeOp = one of 
   *  /  div  mod  and  in 


unaryExpression = 
   unaryOp unaryExpression  
   primaryExpression  


unaryOp =  one of 
   +  -  not 


primaryExpression =  
   variable  
   unsignedInteger  
   unsignedReal  
   string  
   nil  
   funcid ( expressionList )  
   [ elementList ]  
   ( expression )  


elementList =  
   empty  
   element  
   elementList , element  


element =  
   expression  
   expression ... expression  


constid =  
   identifier  


typeid =  
   identifier  


funcid = 
   identifier  


procid =  
   identifier  


fieldid =  
   identifier   

  
varid = 
   identifier  


empty = 

