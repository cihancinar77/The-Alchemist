//
//  ChemistryEngineTests.swift
//  AlchemistTests
//
//  Created by Cihan Cinar on 16.05.2024.
//

import XCTest
@testable import Alchemist

class ChemistryEngineTests: XCTestCase {

    var chemistryEngine: ChemistryEngine!

    override func setUp() {
        super.setUp()
        chemistryEngine = ChemistryEngine()
    }

    override func tearDown() {
        chemistryEngine = nil
        super.tearDown()
    }

    func testInventLabCreationWithTwoElements() {
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.fire, .water]), .steam)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.fire, .air]), .smoke)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.fire, .earth]), .lava)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.water, .air]), .rain)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.water, .earth]), .mud)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.air, .earth]), .dust)
    }

    func testInventLabCreationWithThreeElements() {
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.fire, .water, .air]), .acidRain)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.fire, .water, .earth]), .plant)
        XCTAssertEqual(chemistryEngine.inventLabCreation(elements: [.water, .air, .earth]), .ash)
    }

    func testInventLabCreationWithInvalidElementCount() {
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.fire]))
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.fire, .water, .air, .earth]))
    }

    func testInventLabCreationWithUnknownCombination() {
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.fire, .fire]))
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.water, .water]))
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.air, .air]))
        XCTAssertNil(chemistryEngine.inventLabCreation(elements: [.earth, .earth]))
    }
}
