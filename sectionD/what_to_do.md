<!-- Section D: Asymptotic Computational -->
<!-- Complexity -->
<!-- Instructions -->
<!-- Please select exactly one option. -->
<!-- Please provide your response in a Markdown file. -->
<!-- Please provide justifications for your conclusions. -->
<!-- Please note that both options are in JavaScript. -->

<!-- Option 1: Space Complexity -->
<!-- Please report on the following: -->
<!-- ● The worst-case space complexity of the “doBracketsMatch” function. -->
<!-- ● The worst-case space complexity of the “doBracketsMatch” function if we -->
<!-- extended it to support multiple pairs of opening and closing brackets. -->
<!-- ● At least two alternative design changes that would affect the extension. -->


function BracketStack() {
let openBracketsCount = 0
this.isEmpty = function() {
return openBracketsCount === 0
}
this.push = function() {
openBracketsCount++
}
/**
* @throws If stack is empty
*/
this.pop = function() {
if (this.isEmpty()) throw new Error("Cannot pop empty stack")
openBracketsCount--
}
}
/**
* @param {string} symbol
* @returns A function that checks if a given value is the symbol
*/
function isSymbol(symbol) {
/**
* @param {string} value
* @returns {boolean}
*/
function check(value) {
return symbol === value
}
return check
}
/**
* Checks if a pair of brackets match
* @param {string} inputString
* @param {string} openingSymbol




* @param {string} closingSymbol
*/
function doBracketsMatch(inputString, openingSymbol, closingSymbol)
{
let stack = new BracketStack()
let isOpeningSymbol = isSymbol(openingSymbol)
let isClosingSymbol = isSymbol(closingSymbol)
for (let i = 0; i < inputString.length; i++) {
let value = inputString[i]
if (isOpeningSymbol(value)) stack.push()
if (isClosingSymbol(value))
if (stack.isEmpty()) return false
else stack.pop()
}
return stack.isEmpty()
}
