//
//  bulleyeTests.swift
//  bulleyeTests
//
//  Created by Ai on 2022/09/05.
//

import XCTest
@testable import bulleye

class bulleyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegaitive() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
