// <!-- Section D: Asymptotic Computational -->
// <!-- Complexity -->
// <!-- Instructions -->
// <!-- Please select exactly one option. -->
// <!-- Please provide your response in a Markdown file. -->
// <!-- Please provide justifications for your conclusions. -->
// <!-- Please note that both options are in JavaScript. -->

// <!-- Option 1: Space Complexity -->
// <!-- Please report on the following: -->
// <!-- ● The worst-case space complexity of the “doBracketsMatch” function. -->



// ANSWER: Worst case would surely be when string is at maximum length. From an answer to such a question on Stackoverflow...
// "ECMAScript 2016 (ed. 7) established a maximum length of 2^53 - 1 elements. Previously, no maximum length was specified. In Firefox, strings have a maximum length of 2**30 - 2 (~1GB). In versions prior to Firefox 65, the maximum length was 2**28- 1 (~256MB)."
// Let's assume we are working in Firefox, then max string length is 2^30 - 2 . Since each char uses 4bytes, the memory used should be 2^32-2 bytes or 4.3Gb
// The worst case may however be 2^55 on other platforms: which is 4pebibytes or the theoretical maximum of addressable physical memory on AMD systems https://en.wikipedia.org/wiki/Orders_of_magnitude_(data)
// This implies, worst case in Firefox, that FOR in doBracketsMatch is run 2^30 - 2 times. HOWEVER IF WE LET 2^30-2 = N THEN THE ACTUAL MEMORY BECOMES IRRELEVANT IN THE LOGIC
// A step by step analysis follows
//=========================================================================================================================================
// Time wise
// Let N = 2^53 - 1 then
// 'isOpeningSymbol' run up to N + 1 times
// also running 'check' N+1 times
// i.e.(N+1)+(N+1) =2N+2 steps 
// sim, isClosingSymbol run N+1 times
// with N+1 'check' steps, so there are another 2N+2 steps
// value = 1 ...1 step 
// push.. N steps
//   runs a closure N steps for a total of  2N steps
// pop N^3 steps because isEmpty is N^2 steps so there  is the extra burden of the nesting which makes this tstep N^2*N = N^3
// As a result the time complexity of doBracketsMatch can be added together from the individual steps
//    In total 2N+2+2N+2+1+2N+N^3 = N^3+6N+3 < N^3+6N^3+3N^3=10N^3 which is ...
//              O(N^3) time wise because of the nest in pop()
//==========================================================================================================================================
// Space wise
// function doBracketsMatch(inputString, openingSymbol, closingSymbol){
//     let stack = new BracketStack()   // use  JSON.stringify(BracketStack).length to determine approximate size, but this is called just once, but the size can grow as closure functions are pushed onto the memory stack (not the BracketStack).
//     let isOpeningSymbol = isSymbol(openingSymbol) // returns a boolean at 4 bytes but is stored on the memory stack as a closure when called. use JSON.stringify(isSymbol).length to  get an idea, but let's say it is M and the following isClosingSymbol is also M
//     let isClosingSymbol = isSymbol(closingSymbol) // also returns a boolean at 4 bytes but stored as closure hence M bytes
// i.e. memory is B+M+M
//
// /////// The FOR LOOP in doBracketsMatch //////// WORST CASE FOR input.String is 2^53*4bytes =2^55 bytes of memory
// 4    for (let i = 0; i < inputString.length; i++) {// 'i' = 4 bytes
// 4	let value = inputString[i] // 'value' is a char of 4 bytes dropped at end of block in loop
// FOR LOOP:
//    worst case    MAX of PN*(4+L)=4PN+PNL,  4^3 and Q*S*N=QSN (see below) : choose the first case which is less than 4N^2+N^3 i.e. O(N^3)
//==========================================================================================================================================
// Or for the whole doBracketsMatch block...
//     (4+L)*PN	if (isOpeningSymbol(value)) stack.push() // puts the closure 'push' onto the stack, if 'push' takes up P bytes then potentially call N times with memory P*N until P is popped off the memory stack again by and modifies openBracketCount which stays constant in BracketSTack at 4bytes.
// max of 4*4*4	if (isClosingSymbol(value)) // similary PN bytes
// 		    if (stack.isEmpty()) return false 
// 4^23    else stack.pop() // also calls a closure with another nested closure, say each closure mentioned takes Q and S bytes then this closure before called consumes Q*S bytes									      }
//     return stack.isEmpty() //also a closure let it's size be R worst case R*2^53
// } // B+M+M+4N+4PN+PNL  which is O(N^3)
//===========================================================================================================================================    

// <!-- ● The worst-case space complexity of the “doBracketsMatch” function if we extended it to support multiple pairs of opening and closing brackets. -->

//ANSWER:
//    In such a case doBracketsMatch would have to be called with substrings of the primary string. In so doing it may, worst case, be loaded N/2 times, each time loaded with its own overhead and incrementer. This would push up the worst case space complexity to (N^3)^N/2 < N^3N or O(N^N) for which O(N!) < O(N^N), so if all my logic stands up to scrutiny the worst case of this algorithm will use an intractable amount of space.
//===========================================================================================================================================


// <!-- ● At least two alternative design changes that would affect the extension. -->
//ANSWER:
// see the code modifications...
// but as a design choice remove the unevaluated closures in the LOOP and remove nesting

function BracketStack() {
    let openBracketsCount = 0
    function isEmpty() {
	return openBracketsCount === 0
    }
    
    function push() {
    openBracketsCount++
    }
    /**
     * @throws If stack is empty
     */ Max of 4* 4^22 = 4^23 or 4
    function pop() {
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
function doBracketsMatch(inputString, openingSymbol, closingSymbol){
    let stack = new BracketStack()
    let isOpeningSymbol = isSymbol(openingSymbol)
    let isClosingSymbol = isSymbol(closingSymbol)
/////// The FOR LOOP ////////
    for (let i = 0; i < inputString.length; i++) {
	let value = inputString[i]
	opener? = (isOpeningSymbol(value))
	closer? = (isClosingSymbol(value))
	if opener? stack.push()
	else if closer? && stack.isEmpty() return false
	else stack.pop()
    }
//////////////////////////////
    return stack.isEmpty()
}


