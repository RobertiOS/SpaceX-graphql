//
//  FruitsGraphQLTests.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/26/22.
//

import XCTest
import Combine

@testable import FruitsGraphQL

final class FruitsGraphQLTests: XCTestCase {
    
    var viewModelRepresentable: MainListViewModelRepresentable!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        viewModelRepresentable = MainListViewModel<AppCoordinator>()
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
        let expectation = expectation(description: "Wait for load data subject")
        viewModelRepresentable.launchesListSubject.sink { _ in
        } receiveValue: { launches in
            XCTAssert(launches.isEmpty == false)
            expectation.fulfill()
        }.store(in: &cancellables)
        viewModelRepresentable.loadMoreLaunches()
        wait(for: [expectation], timeout: 1)
    }
    
    func testSearchData() {
        let searchText = "VAFB SLC 4E"
        let expectation = XCTestExpectation(description: "Wait for loading data")

        viewModelRepresentable.launchesListSubject.sink { _ in
        } receiveValue: { launches in
            expectation.fulfill()
        }.store(in: &cancellables)

        viewModelRepresentable.loadMoreLaunches()

        wait(for: [expectation], timeout: 1)

        let searchingExpectation = XCTestExpectation(description: "Searching expectation")
        
        viewModelRepresentable.launchesListSubject.sink { _ in
        } receiveValue: { launches in
            XCTAssert(launches.first?.site == searchText)
            searchingExpectation.fulfill()
        }.store(in: &cancellables)

        viewModelRepresentable.search(text: searchText)

        wait(for: [searchingExpectation], timeout: 1)
        
    }
    
    func testSearchDataWithEmptyText() {
        let searchText = ""
        var totalLaunches: Int = 0
        let expectation = XCTestExpectation(description: "Wait for loading data")

        viewModelRepresentable.launchesListSubject.sink { _ in
        } receiveValue: { launches in
            totalLaunches = launches.count
            expectation.fulfill()
        }.store(in: &cancellables)

        viewModelRepresentable.loadMoreLaunches()

        wait(for: [expectation], timeout: 1)

        let searchingExpectation = XCTestExpectation(description: "Searching expectation")
        
        viewModelRepresentable.launchesListSubject.sink { _ in
        } receiveValue: { launches in
            XCTAssert(totalLaunches == launches.count)
            searchingExpectation.fulfill()
        }.store(in: &cancellables)

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
