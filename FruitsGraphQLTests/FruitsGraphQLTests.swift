//
//  FruitsGraphQLTests.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/26/22.
//

import XCTest
@testable import FruitsGraphQL

final class FruitsGraphQLTests: XCTestCase {
    
    var viewModelRepresentable: MainListViewModelRepresentable!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        viewModelRepresentable = MainListViewModel(apolloCLient: APIManager.shared.apolloClient)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        viewModelRepresentable = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testLoadData() {
        //given
        viewModelRepresentable.loadMoreLaunches()
        //when
        let expectation = expectation(description: "Wait for load data subject")
        let cancellable = viewModelRepresentable.launchesListSubject.sink { _ in
            
        } receiveValue: { launch in
            XCTAssert(launch.isEmpty == false)
            expectation.fulfill()
        }

        //then
        wait(for: [expectation], timeout: 1)
    }
    
    func testSearchData() {
        //given
        let expectation = expectation(description: "Wait for loading data")
        viewModelRepresentable.loadMoreLaunches()
        //when
        viewModelRepresentable.search(text: "Vafb slc 4e")
//        let searchingExpectation = expectation(description: "Wait searching data")
//        expectation(description: "")
        
        let _ = viewModelRepresentable.launchesListSubject.sink { _ in
            
        } receiveValue: { launches in
            XCTAssert(launches.count == 1)
            expectation.fulfill()
        }

        //then
        wait(for: [expectation], timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
