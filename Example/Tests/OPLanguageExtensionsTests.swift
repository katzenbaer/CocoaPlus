//
//  OPLanguageExtensionsTests.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/28/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit
import XCTest

//public func &=<T: AnyObject> (object: T, block: (object: T) -> ()) -> T {
//    block(object: object)
//    return object
//}

class OPLanguageExtensionsTests: XCTestCase {
    
    class TestClass {
        var someVar = "Default"
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAndSetDefault() {
        let instance = TestClass()
        XCTAssert(instance.someVar == "Default")
    }
    
    func testAndSetSomeVar() {       
        let instance = TestClass() &= {
            $0.someVar = "NewValue"
        }
        XCTAssert(instance.someVar == "NewValue")
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
