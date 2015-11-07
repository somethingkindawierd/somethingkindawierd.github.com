//: [Previous](@previous)

import Foundation
import JavaScriptCore

let context = JSContext()
context.exceptionHandler = { context, exception in
    let error = exception
    print("JS Error: \(error)")
}

// Export the class for use in javascript
context.setObject(Point.self, forKeyedSubscript: "Point")

// Create instance of point
context.evaluateScript("var pt = Point.createXY(10, 20);")

// Access value from JavaScript context
let pt:Point = context
    .objectForKeyedSubscript("pt")
    .toObjectOfClass(Point.self) as! Point

//: [Next](@next)