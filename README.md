# SwiftCommons
Simple helper swift extensions for easily development.

## Installation
Copy all the files from the SwiftCommons/Classes folder to your project.

## APIs

### Global functions
* isEven(:Int) -> Bool
* isOdd(:Int) -> Bool
* ngt(:Int) -> Int
* screenSize() -> CGSize
* screenWidth() -> CGFloat
* screenHeight() -> CGFloat

### GCD functions
* dispatchAfter(delay delay: Double, closure: () -> ())
* dispatchAsync(queue: GCDQueue, closure: () -> ())
* dispatchSync(queue: GCDQueue, closure: () -> ())

```swift
dispatchAsync(.Default) {
    dispatchSync(.Main) {
        ...
    }
}
```

### Foundation extensions

#### Array
* subscript(orNil index: Int) -> Element?
* inits() -> Array
* tail() -> Array
* take(:Int) -> Array
* drop(:Int) -> Array
* forEach(:Element -> ())
* reduce1(:(a: Element, b: Element) -> Element) -> Element
* mutating func insertHead(e: Element)

#### SequenceType
* replaceLast(replacement: Generator.Element) -> [Generator.Element]
* group() -> [[Generator.Element]]
* groupBy(condition: (Generator.Element, Generator.Element) -> Bool) -> [[Generator.Element]]
* concat() -> [Generator.Element.Generator.Element]

#### String
* * :Int -> String
* length: Int
* subscript(i: Int) -> String
* subscript(range: Range<Int>) -> String
* trim() -> String
* trimn() -> String
* split(separator: String) -> [String]
* urlEncode() -> String
* urlDecode() -> String
* toDate(format format: String) -> NSDate?
* mask() -> String
* mask(mask: String) -> String
* maskHead(count count: Int) -> String
* maskHead(mask: String, count: Int) -> String
* maskTail(count count: Int) -> String
* maskTail(mask: String, count: Int) -> String

#### NSDate
* NSDate.fromRFC3339String(string: String) -> NSDate?
* NSDate.toRFC3339String(date: NSDate) -> String?
* unixtime() -> NSTimeInterval
* NSDate.fromUnixtime(unixtime: NSTimeInterval) -> NSDate

### UIKit extensions

#### UIColor
* fromHex(hex: String) -> UIColor?

#### UIView
* operators
  * += CGPoint
  * -= CGPoint
  * += CGSize
  * -= CGSize
* properties
  * x: CGFloat
  * y: CGFloat
  * width: CGFloat
  * height: CGFloat
  * right: CGFloat
  * bottom: CGFloat
  * position: CGPoint
  * size: CGSize
* methods
  * hide() -> UIView
  * show() -> UIView
  * findView(:(:UIView) -> Bool) -> UIView?
  * findViews(f: (view: UIView) -> Bool) -> [UIView]
  * applyAllSubviews(f: (view: UIView) -> ())
  * applyAllViews(f: (view: UIView) -> ())

#### UIViewController
* exclusiveTouches()

### Protocol Extensions

#### StoryboardInitializable where Self: UIViewControlle
 * static func instantiateStoryboard() -> Self
 * static func instantiateStoryboard(bundle bundle: NSBundle?) -> Self
 * static func instantiateStoryboard(identifier identifier: String) -> Self     
 * static func instantiateStoryboard(bundle bundle: NSBundle?, identifier: String) -> Self

#### XibInitializable where Self: UIView
 * static func instantiateXib() -> Self
 * static func instantiateXib(bundle bundle: NSBundle?) -> Self

### Debug helpers
 * typealias D = Debug
 * Debug.time(process: () -> ()) -> NSTimeInterval
 * Debug.timePrint(label: String = "", process: () -> ())
 * Debug.debug(string)
 * Debug.info(string)
 * Debug.warn(string)
 * Debug.error(string)
 * Shortcuts
   * Debug.t(label: String = "", process: () -> ())
   * Debug.d(string)
   * Debug.i(string)
   * Debug.w(string)
   * Debug.e(string)

## Requirements

Swift 2.0 / iOS 8.0+

## License

The MIT License. See LICENSE for details.

===========
[@tobi462](https://twitter.com/tobi462), August 2015.
