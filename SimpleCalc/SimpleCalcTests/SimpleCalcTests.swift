//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import XCTest

class ExtendedCalcTests :XCTestCase {
    let calc = Calculator()
    
    func testNegativeOps() {
        XCTAssert(calc.calculate(["2", "+", "-12"]) == -10)
    }
}

class SimpleCalcTests: XCTestCase {
    
    let calc = Calculator()
    
    func testSimpleOps() {
        XCTAssert(calc.calculate(["2", "+", "2"]) == 4)
        XCTAssert(calc.calculate(["2", "-", "2"]) == 0)
        XCTAssert(calc.calculate(["2", "*", "2"]) == 4)
        XCTAssert(calc.calculate(["2", "/", "2"]) == 1)
        XCTAssert(calc.calculate(["2", "%", "2"]) == 0)
    }
    
    func testCountOps() {
        XCTAssert(calc.calculate(["1", "2", "3", "count"]) == 3)
        XCTAssert(calc.calculate(["1", "2", "3", "4", "5", "count"]) == 5)
        XCTAssert(calc.calculate(["count"]) == 0)
    }
    
    func testAvgOps() {
        XCTAssert(calc.calculate(["1", "2", "3", "4", "5", "avg"]) == 3) // 15 / 5 = 3
        XCTAssert(calc.calculate(["2", "2", "4", "4", "avg"]) == 3) // 12 / 4 = 3
        XCTAssert(calc.calculate(["2", "avg"]) == 2) // 2 / 1 = 2
        XCTAssert(calc.calculate(["avg"]) == 0) // 0 / 0 = 0 (not really, but it's an edge case
    }
    
    func testFactOps() {
        XCTAssert(calc.calculate(["1", "fact"]) == 1)
        XCTAssert(calc.calculate(["1", "fact"]) == 1)
        XCTAssert(calc.calculate(["2", "fact"]) == 2) // 2*1
        XCTAssert(calc.calculate(["5", "fact"]) == 120) // 5*4*3*2*1
        XCTAssert(calc.calculate(["fact"]) == 0)
    }
    
    func testSingleStringSimpleOps() {
        XCTAssert(calc.calculate("2 + 2") == 4)
        XCTAssert(calc.calculate("2 * 2") == 4)
        XCTAssert(calc.calculate("2 - 2") == 0)
        XCTAssert(calc.calculate("2 / 2") == 1)
    }
    
    func testSingleStringComplexOps() {
        let testsAndResults = [
            ("1 2 3 4 5 count", 5),
            ("1 2 3 4 5 avg", 3),
            ("5 fact", 120)
        ]
        
        for tup in testsAndResults {
            XCTAssert(calc.calculate(tup.0) == tup.1)
        }
    }
}
