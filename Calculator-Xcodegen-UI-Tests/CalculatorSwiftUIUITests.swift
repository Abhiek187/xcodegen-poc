//
//  Calculator_SwiftUIUITests.swift
//  Calculator-SwiftUIUITests
//
//  Created by Basanta Chaudhuri on 5/20/21.
//

import XCTest

class CalculatorSwiftUIUITests: XCTestCase {
    var app: XCUIApplication!

    // Run each UI test for every combination of orientation, localization, and appearance the app supports
//    override class var runsForEachTargetApplicationUIConfiguration: Bool {
//        true
//    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation
        // - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        try super.tearDownWithError()
    }

    func testSimpleEquation() {
        // 2 + 3 = 5
        let labelOutput = app.staticTexts.firstMatch
        let button2 = app.buttons["2"]
        let buttonPlus = app.buttons["+"]
        let button3 = app.buttons["3"]
        let buttonEquals = app.buttons["="]

        XCTAssertEqual(labelOutput.label, "0")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        buttonPlus.tap()
        XCTAssertEqual(labelOutput.label, "2.0 + ")
        button3.tap()
        XCTAssertEqual(labelOutput.label, "2.0 + 3")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "5.0")
    }

    func testComplexEquation() {
        // -0.1 * 7 / 2 = -0.35
        let labelOutput = app.staticTexts.firstMatch
        let buttonNegative = app.buttons["(-)"]
        let button0 = app.buttons["0"]
        let buttonDot = app.buttons["."]
        let button1 = app.buttons["1"]
        let buttonMultiply = app.buttons["*"]
        let button7 = app.buttons["7"]
        let buttonEquals = app.buttons["="]
        let buttonDivide = app.buttons["/"]
        let button2 = app.buttons["2"]

        XCTAssertEqual(labelOutput.label, "0")
        buttonNegative.tap()
        XCTAssertEqual(labelOutput.label, "-0")
        button0.tap()
        XCTAssertEqual(labelOutput.label, "-0")
        buttonDot.tap()
        XCTAssertEqual(labelOutput.label, "-0.")
        button1.tap()
        XCTAssertEqual(labelOutput.label, "-0.1")
        buttonMultiply.tap()
        XCTAssertEqual(labelOutput.label, "-0.1 * ")
        button7.tap()
        XCTAssertEqual(labelOutput.label, "-0.1 * 7")
        buttonDivide.tap()
        XCTAssertEqual(labelOutput.label, "-0.7000000000000001 / ")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "-0.7000000000000001 / 2")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "-0.35000000000000003")
    }

    func testWeirdEquation() {
        // 0 ^ 0 = 1, 1 / -0 = -infinity, -infinity % 0 = NaN
        let labelOutput = app.staticTexts.firstMatch
        let buttonExponent = app.buttons["^"]
        let button0 = app.buttons["0"]
        let buttonNegative = app.buttons["(-)"]
        let buttonDivide = app.buttons["/"]
        let buttonMod = app.buttons["%"]
        let buttonEquals = app.buttons["="]

        XCTAssertEqual(labelOutput.label, "0")
        buttonExponent.tap()
        XCTAssertEqual(labelOutput.label, "0.0 ^ ")
        button0.tap()
        XCTAssertEqual(labelOutput.label, "0.0 ^ 0")
        buttonDivide.tap()
        XCTAssertEqual(labelOutput.label, "1.0 / ")
        buttonNegative.tap()
        XCTAssertEqual(labelOutput.label, "1.0 / -")
        button0.tap()
        XCTAssertEqual(labelOutput.label, "1.0 / -0")
        buttonMod.tap()
        XCTAssertEqual(labelOutput.label, "-inf % ")
        button0.tap()
        XCTAssertEqual(labelOutput.label, "-inf % 0")
        buttonNegative.tap()
        XCTAssertEqual(labelOutput.label, "-inf % -0")
        buttonNegative.tap()
        XCTAssertEqual(labelOutput.label, "-inf % 0")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "nan")
    }

    func testNoEquation() {
        // -1 ^ 0.5
        let labelOutput = app.staticTexts.firstMatch
        let button1 = app.buttons["1"]
        let buttonNegative = app.buttons["(-)"]
        let buttonExponent = app.buttons["^"]
        let button0 = app.buttons["0"]
        let buttonDot = app.buttons["."]
        let button5 = app.buttons["5"]
        let buttonBack = app.buttons["↩︎"]

        XCTAssertEqual(labelOutput.label, "0")
        button1.tap()
        XCTAssertEqual(labelOutput.label, "1")
        buttonNegative.tap()
        XCTAssertEqual(labelOutput.label, "-1")
        buttonExponent.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ ")
        button0.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ 0")
        buttonDot.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ 0.")
        button5.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ 0.5")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ 0.")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ 0")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1.0 ^ ")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1.0")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1.")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-1")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "-")
        buttonBack.tap()
        XCTAssertEqual(labelOutput.label, "0")
    }
}
