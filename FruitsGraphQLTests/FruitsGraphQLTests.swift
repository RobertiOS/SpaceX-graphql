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
            
        } receiveValue: { launches in
            XCTAssert(launches.isEmpty == false)
            expectation.fulfill()
        }

        //then
        wait(for: [expectation], timeout: 1)
    }
    
    func testSearchData() {
        
        let searchText = "VAFB SLC 4E"
        
        let expectation = XCTestExpectation(description: "Wait for loading data")
        
        let cancellable = viewModelRepresentable.launchesListSubject.sink { completion in
            debugPrint(completion)
        } receiveValue: { launches in
            debugPrint("The count is \(launches.count)")
            expectation.fulfill()
        }
        viewModelRepresentable.loadMoreLaunches()
        
        wait(for: [expectation], timeout: 1)

        
        let searchingExpectation = XCTestExpectation(description: "Searching expectation")
        
        
        let searchCancellable = viewModelRepresentable.launchesListSubject.sink { completion in
            debugPrint(completion)
        } receiveValue: { launches in
            debugPrint(launches.first?.site)
            XCTAssert(launches.first?.site == searchText)
            searchingExpectation.fulfill()
        }
        viewModelRepresentable.search(text: searchText)
        
        wait(for: [searchingExpectation], timeout: 1)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
