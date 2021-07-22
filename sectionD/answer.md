---
output:
  html_document: default
  pdf_document: default
---
***Section D: Asymptotic Computational Complexity***

__Instructions__ 

- Please select exactly one option. 
- Please provide your response in a Markdown file.
- Please provide justifications for your conclusions. 
- Please note that both options are in JavaScript. 

*Option 1: Space Complexity*

- Please report on the following:

__The worst-case space complexity of the “doBracketsMatch” function.__

_ANSWER_: 
The worst case would surely be when the string is at its maximum length. From an
answer to such a question on Stackoverflow... 

"ECMAScript 2016 (ed. 7) established a maximum length of 2^53 - 1 elements. Previously, no maximum length was specified. In Firefox, strings have a maximum length of 2**30 - 2 (~1GB). In versions prior to Firefox 65, the maximum length was 2**28- 1 (~256MB)."

If we assume we are working in Firefox, then max string length is 2^30 - 2 .
Since each char uses 4bytes, the memory used should be 2^32-2 bytes or 4.3Gb //

The worst case may however be 2^55 on other platforms: which is 4pebibytes which is
the theoretical maximum of addressable physical memory on AMD systems
[https://en.wikipedia.org/wiki/Orders_of_magnitude_(data)] 

The worst possible case is that the 'FOR' block in doBracketsMatch is run 2^55 times. HOWEVER IF
WE LET N = 2^55 THEN THE ACTUAL MEMORY BECOMES IRRELEVANT IN THE LOGIC as we can just deal with the patterns surrounding N

__A step by step analysis of the spacial complexity follows__

function BracketStack() {
  let openBracketsCount = 0
  this.isEmpty = function() {
    return openBracketsCount === 0
  }
  this.push = function() {
    openBracketsCount++
  }
  this.pop = function() {
    if (this.isEmpty()) throw new Error("Cannot pop empty stack")
    openBracketsCount--
  }
}
function isSymbol(symbol) {
  function check(value) {
    return symbol === value
  }
  return check
}

function doBracketsMatch(inputString, openingSymbol, closingSymbol){
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

Suppose N is the maximum number of times the loop block is run. i.e. the length of the inputString.

Suppose the size of BracketStack is B. BracketStack is called just once, however it's size will keep growing as the closures associated with it (the closures pop, push and isEmpty) are added to the memory stack during the possibly vast loop block in doBracketsMatch.

Let's just see how much memory is added in one iteration of the loop.

- 1    *let value = inputString[i]*       value is  1 char or 8 bytes for a UTF8 encoding.
- 2    *if (isOpeningSymbol(value))*      the worst case memory assignment of 
                                        this direction block is the maximum 
                                        assigment between the max of line 3 and the max of line 6 or                                         line 8 i.e the max between lines 3, 6 and 8
- 3      *stack.push()*                   assigns a closure to the memory stack, suppose it is B bytes
- 4     *if (isClosingSymbol(value))*
- 5        *if (stack.isEmpty()) *
- 6         *return false         *       returns a boolean which is 4 bytes
- 7        *else *
- 8          *stack.pop()*                assigns a nested closure to the memory stack, this would take up B*B space.

Clearly the max of 3,6 and 8 is line 8 of B^2.

Therefore if in the worst case the loop is run N times then the memory allocation maximally would be O(N*B^2) < O(N*N^2) = O(N^3) if B<N. or < O(B^3) if B>N

__For the whole doBracketsMatch block...__ 



__The worst-case space complexity of the “doBracketsMatch” function if
we extended it to support multiple pairs of opening and closing brackets.__

__ANSWER:__ In such a case doBracketsMatch would have to be called with
substrings of the primary string. In so doing it may, worst case, be loaded (N-1)!
times, each time loaded with its own overhead and incrementer. This would push
up the worst case space complexity to (N^3)*(N-1)! < (N^3)*N! Hence, the space complexity is O(N!). So if all my logic stands up to scrutiny the worst case of this algorithm will use an intractable amount of space.


__At least two alternative design changes that would affect the
extension.__

__ANSWER:__
As a design choice I would remove the unevaluated closures in the LOOP and remove nesting
functions, especially in the closures.

See the code modifications... 

function BracketStack() { 
  let this.openBracketsCount = 0
  function this.isEmpty() { 
    return openBracketsCount < 1 
  }
  function this.push() { 
    openBracketsCount++ 
  } 
  function this.pop() { 
    return openBracketsCount-- 
  } 
} 

function doBracketsMatch(inputString, openingSymbol, closingSymbol){
  let oSym = openingSymbol
  let cSym = closingSymbol
  let stack = new BracketStack()

  
  for (let i = 1; i < inputString.length; i++) { 
    let val = inputString[i] 
    if (cSym === val)
      if stack.isEmpty() { throw new Error("Can't pop an empty stack");return false}
      else  stack.pop()
    else if (oSym === val) stack.push() 

  }
  return stack.isEmpty()
}

Please note that I haven't run this code, nor am I vary familiar with javascript, so there could be some errors were it to be run. I have gone through the logic, and it feels, very shallowly, that this would work.