program = (statement )* "EOF"

statement = expr_statement
            / if_statement
            / for_statement
            / fn_declaration
            / var_declaration
            / const_declaration
            / block
            
expr_statement = expression ";"
if_statement = "if" grouping block ("else" block/if_statement)?
for_statement = "for" for_grouping? break_block
fn_declaration = "fn" identifier "(" parameter_list? ")" return_block
var_declaration = "var" assignment_expression_var_const ";"
const_declaration = "const" assignment_expression_var_const ";"

parameter_list = identifier ("," expression)*

block = "{"statement* "}"
break_block = "{"statement* ("break" ";")? "}"
return_block = "{"statement* (expression)? ("return" ";")? "}"

for_stmt = for_grouping/ (statement)? expression (";" expression)? 
for_grouping = "(" for_stmt ")"


assignment_expression = identifier "=" expression

assignment_expression_var_const = identifier ( "=" expression )?

expression = logic_or/assignment_expression

logic_or  = logic_and ("||" logic_and)
logic_and = equality ("&&" equality)
equality = comparison (("==" / "!=") comparison)*
comparison = addition ((">" / ">=" / "<" / "<=") addition)*
addition = multiplication (("+" / "-") multiplication)*
multiplication = unary (("*" / "/" / "%") unary)*
unary = ("!" unary) / primary

primary = literal
        / identifier
        / array_literal
        / array_access
        / function_call
        / grouping
        


grouping = "("expression")"
array_literal = "[" (expression ("," expression)*)? "]"
array_access = identifier "[" expression "]"

function_call = identifier "(" (expression ("," expression)*)? ")"


literal = number/string_literal/boolean_literal/"nil"

boolean_literal = "true" / "false"

//increment = identifier "++" ";"
//decrement = identifier "--" ";"

number = [0-9]+("."[0-9]+)?
identifier = [a-zA-Z_] [a-zA-Z0-9_]*
string_literal  = '"' (!"\"" .)* '"'
