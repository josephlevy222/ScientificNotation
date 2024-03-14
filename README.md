The core routine func scientificNotation(_:Double) creates a String from a Double using true superscript notation for the exponent. So instead of getting 1.543567e+03 we have 1.543567×10³.  Formats and an exponent exclusion range can be specified also in 
```swift
func scientificNotation(format: String = "%g",_ x: Double, exponentExclusion: any RangeExpression<Int> = 0...1) -> String
```
The format can set the significant digits, and trailing zeros in the usual way using g or f formats with # and .(digits).  Clearly e/E formats should be avoided. 
