# SwiftCommons
Swift commons library.

# Global functions
- isEven(:Int) -> Bool
- isOdd(:Int) -> Bool
- ngt(:Int) -> Int

# Foundation extensions

## Array
- inits() -> Array
- tail() -> Array
- take(:Int) -> Array
- drop(:Int) -> Array
- forEach(:Element -> ())
- reduce1(:(a: Element, b: Element) -> Element) -> Element

## String
- subscript(i: Int) -> String
- subscript(range: Range<Int>) -> String
- length() -> Int

# UIKit

## UIColor
- fromHex(hex: String) -> UIColor?

## UIView
- += (:CGFloat, :CGFloat)
- -= (:CGFloat, :CGFloat)
- x: CGFloat
- y: CGFloat
- width: CGFloat
- height: CGFloat
- right: CGFloat
- bottom: CGFloat
