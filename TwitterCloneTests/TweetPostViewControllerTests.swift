//
//  TweetPostViewControllerTests.swift
//  TwitterCloneTests
//
//  Created by Dee Jordan on 2/3/2025.
//
//test

import XCTest
@testable import TwitterClone

final class TweetPostViewControllerTests: XCTestCase {

    var sut: TweetPostViewController!
       
       override func setUp() {
           super.setUp()
           sut = TweetPostViewController()
       }
       
       override func tearDown() {
           super.tearDown()
           sut = nil
           
       }
       
       func testIsTweetWithinLimit_ValidTweet_ReturnsTrue() {
           let validTweet = String(repeating: "a", count: 140)
           
           let result = sut.isTweetWithinLimit(validTweet)

           XCTAssertTrue(result, "140文字以下のツイートはtrue")
       }
       
       func testIsTweetWithinLimit_InvalidTweet_ReturnsFalse() {
           let invalidTweet = String(repeating: "a", count: 141)

           let result = sut.isTweetWithinLimit(invalidTweet)

           XCTAssertFalse(result, "140文字を超えるツイートはfalse")
       }
}
