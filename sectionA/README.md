# Guidlines for code review #

A good guide (IMO) to code review is Ryan McDermott's github repository: [ryanmcdermott/code-review-tips](https://github.com/ryanmcdermott/code-review-tips).

---

The two most important points he raises are

1. automate as much as possible
2. be kind in your review

---

For readablilty,

1. Typos should be corrected
2. Functions should be kept short - they should do one thing!
3. And naming of variables and functions should be clear.
4. Files need to be cohesive and ideally short.
5. Exported functions should be documented
6. Complex code should be commented
7. I/O functions should handle when something goes wrong.
8. 
   i.  Null cases
   ii. Large cases
   iii. Singular cases 
should all be handled

---

There are also security considerations

1. Remove personally identifiable information
2. Block cross-site-scripting.

---

In terms of algorithms 

1. Functions should use efficient algorithms
2. Important actions should be logged

---

Testing

1. New code should be tested
2. Tests should test for all the function does
3. Stress tests and boundary cases need consideration

---

Misc

1. Keep track of TODOs
2. Make your commit messages clear, incl. a ticket number if possible
3. Make sure the code does what it is supposed to do.
