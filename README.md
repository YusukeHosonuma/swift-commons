# SwiftCommons
Swift commons library.

# Global functions
- isEven()
- isOdd()

# Foundation extensions

## Array
- inits() -> Array
- tail() -> Array
- take(n: Int) -> Array
- drop(n: Int) -> Array
- forEach(f: Element -())
- reduce1(f: (a: Element, b: Element) -> Element) -> Element

## String
- subscript(i: Int) -> String
- subscript(range: Range<Int>) -> String
- length() -> Int

# UIKit

## UIColor
- fromHex(hex: String) -> UIColor?
