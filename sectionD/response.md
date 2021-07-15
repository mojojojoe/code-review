Instructions
Please select exactly one option.
Please provide your response in a Markdown file.
Please provide justifications for your conclusions.
Please note that both options are in JavaScript.


Option 2: Time Complexity
Please report on the following:
● The worst-case time complexity of the “Collection.add” method.
● At least two alternative designs that would improve the worst-case time
complexity without using arrays or any other predefined collection type.
● The worst-case time complexity of the alternative designs.


class Collection {
#value
#next
constructor(value, next) {
this.#value = value
if (next) this.#next = new Collection(next)
else this.#next = null
}
get value() { return this.#value }
get next() { return this.#next }
add(value) {
let next
for (next = this.#next; next && next.#next; next = next.#next) ;
if (!next) next = this
next.#next = new Collection(value)
}
}
