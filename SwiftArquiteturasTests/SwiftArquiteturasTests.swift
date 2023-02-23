//
//  SwiftArquiteturasTests.swift
//  SwiftArquiteturasTests
//
//  Created by Igor Fortti on 23/02/23.
//

import XCTest
@testable import SwiftArquiteturas

class SwiftArquiteturasTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() throws {
        var userModel = UserModel()
        
        let exp = expectation(description: "Check Login is succesful")
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "teste@teste.com", password: "a12345") { userM in
            print(userM)
            userModel = userM
        } failureHandler: { error in
            print(error ?? "error")
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationWithTimeout errored: \(error)")
            }
            XCTAssertEqual(userModel != nil, true)
        }
    }
    
//    func testlogin() throws {
//        let manager = UserManager(business: UserBusiness())
//
//        manager.login(email: "teste@teste.com", password: "a12345") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error ?? "error")
//        }
//    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
