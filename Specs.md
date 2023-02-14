# Project styling guidelines

## Overall Structure
    - Two lines between "Objects"

## Comments
    - Should be either on the first column or the 32nd column
    - Must be one space from comment char
    - Must be properly capitalized
    - Must be properly punctuated if longer than one statement

## Functions
    - Must define parameters in comments before declaration as such
    "$register -> purpose"
    - In cases where 2 registers should be the same value, seperating them by a colon is fine
    - Function names must be in UpperCamelCase
    - Functions should be split into 1 or 3 (more if more internal loops) sections "Function" "\_FunctionMain" and "\_FunctionEnd". The "Function" section should be used for any state reserving and the "\_FunctionEnd" should be used for recovering state.
    - Functions should have no undesired side effects. Any registers that will be left changed should be documented in the prefixed codeblock
    - Private functions should be prefixed by "\_"

## Constants and addresses
    - Constants should be defined at the top of a file
    - Addresses should be defined at the End of a file typically after an infinite loop to avoid garbage data being run
    - Constants and addresses should be defined in UPPER\_SNAKE\_CASE


