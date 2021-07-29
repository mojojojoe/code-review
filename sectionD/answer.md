***Section D: Asymptotic Computational Complexity***

__Instructions__ 

- Please select exactly one option. 
- Please provide your response in a Markdown file.
- Please provide justifications for your conclusions. 
- Please note that both options are in JavaScript. 

*Option 1: Space Complexity*

- Please report on the following:

1. ___The worst-case space complexity of the “doBracketsMatch” function.___


The worst case would surely be when the string is at its maximum length. From an
answer to such a question on Stackoverflow... 


> "ECMAScript 2016 (ed. 7) established a maximum length of 2^53 - 1 elements. Previously, no maximum length was specified."

> "In Firefox, strings have a maximum length of 2^30 - 2 (~1GB). In versions prior to Firefox 65, the maximum length was 2^28- 1 (~256MB)."


So in the worst case the input string  may be 2^53-1 characters 

In other words, the worst possible case may be for the looped block in doBracketsMatch to run 2^53 - 2 times and hence any cached memory to be accrued that many times too.

Since 2^56 bytes(or 4 pebibytes) is the theoretical maximum of addressable physical memory on AMD systems [https://en.wikipedia.org/wiki/Orders_of_magnitude\_(data)] then
assuming the holding computer has that memory the amount of memory per iteration of the loop should not exceed 2^56/(2^53-2)Bytes = 2^56/2(2^52-1) = 2^55/(2^52-1) < 2^55/2^52-2 = 2^54/2^51-1 which by induction is less than 2^4/(2^1-1)=16 bytes or 2 characters per iteration in the worst case.

>___Spacial complexity analysis___
```
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
		#####LOOP######
		for (let i = 0; i < inputString.length; i++) {
			let value = inputString[i]
			if (isOpeningSymbol(value)) stack.push()
			if (isClosingSymbol(value))
			if (stack.isEmpty()) return false
			else stack.pop()
		####END LOOP####	
		}
		return stack.isEmpty()
OB	}
```
Suppose 2n+1 is number of times the loop block is run. i.e. the length of the inputString.

Suppose the size of BracketStack is B. BracketStack is called just once, however it's size will keep growing as the closures associated with it (the closures pop, push and isEmpty) are added to the memory stack during the possibly vast loop block in doBracketsMatch.

How much memory is added in one iteration of the loop? 

The loop has 3 outcomes: line 3, a push(); line 6, a "false" or line 8, a pop().
The pop() contains a nested closure so any memory allocated to the pop() would be C*C if C is the amount of memory allocated to a closure alone (that is not nested).
On any string , the way to acieve n, the number of pop()'s would first be to push() n times onto the stack. 
That way the openBracketCount would increment as much as possible and consequently be decremented the most possible through pop() before terminating in an isEmpty().
push n times then pop n times then isEmpty once. The string would need to be 2n+1 long. Since the worst case is 2^53-1 we can equate these to find N the worst case for n.
2N+1= 2^53-1 or N = 2^52-1.

| Code                        | Analysis                                                                              | Line number |
|-----------------------------|---------------------------------------------------------------------------------------|-------------|
| let value = inputString[i]  | value is  1 char or 8 bytes for a UTF8 encoding.                                      | 1           |
| if (isOpeningSymbol(value)) | the worst case memory assignment of                                                   | 2           |
|                             | this direction block is the maximum memory                                            |             |
|                             | assigment of one of lines 3, 6 and 8, whichever is worst                              |             |
| stack.push()                | assigns a closure to the memory stack ("push()" has a closure). Suppose it is C bytes | 3           |
| if (isClosingSymbol(value)) |                                                                                       | 4           |
| if (stack.isEmpty())        |                                                                                       | 5           |
| return false                | returns a boolean which is 4 bytes                                                    | 6           |
| else                        |                                                                                       | 7           |
| stack.pop()                 | assigns a nested closure to the memory stack, this would take up C*C space.           | 8           |
|                             |                                                                                       |             |


Therefore if in the worst case the loop is run 2^53-1 times and the memory allocation maximally would be less than 4 + N*B + N\*B^2 < O(N\*N^2) or __O(N^3)__  if B<N. 


2. ___The worst-case space complexity of the “doBracketsMatch” function if we extended it to support multiple pairs of opening and closing brackets.__

In such a case doBracketsMatch would have to be called with substrings of the primary string. In so doing it may, worst case, be loaded (N-1)! times, each time loaded with its own overhead and incrementer. This would push up the worst case space complexity to (N^3)*(N-1)! < (N^3)*N! Hence, the space complexity is O(N!). So if all my logic stands up to scrutiny the worst case of this algorithm will use an intractable amount of space.


3. __At least two alternative design changes that would affect the extension.__

As a design choice I would remove the unevaluated closures in the LOOP and remove nested functions, especially in the closures.

Modified code:
```
function BracketStack() { 
  let this.openBracketsCount = 0
  function this.isEmpty() { 
    return openBracketsCount < 1 
  }
  function this.push() { 
    openBracketsCount++ 
  } 
  function this.pop() { 
    openBracketsCount-- 
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
```

