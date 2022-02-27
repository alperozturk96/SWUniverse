//
//  CharacterListDataSourceTests.swift
//  SWUniverseTests
//
//  Created by Alper Öztürk on 12.02.2022.
//

import XCTest
import Combine
@testable import SWUniverse

class CharacterListDataSourceTests: XCTestCase {
    
    var sut:CharacterListDataSource!
    var characterList:CharacterList!
    var resultWrapper:MockResultWrapper!
    
    override func setUp() {
        sut = CharacterListDataSource(cancellables: Set<AnyCancellable>())
        characterList = CharacterListTestData.init().testData
        resultWrapper = MockResultWrapper()
    }
    
    override func tearDown() {
        sut = nil
        resultWrapper = nil
        characterList = nil
    }
    
    func testFetching_WhenGivenURLIsEmpty_ShouldReturnTrue(){
        //Act
        if resultWrapper.mockPublisher(url: "") == nil {
            //Assert
            XCTAssertTrue(true)
        }
        else
        {
            XCTFail()
        }
    }
    
    func testSearchCharacter_WhenGivenSuccesfullResponse_ShouldReturnNotNilCharacter(){
        //Arrange
        var mockData:Data!
        
        do
        {
            mockData = try JSONEncoder().encode(characterList)
        }
        catch
        {
            XCTFail()
        }
        
        //Insert MockData
        MockURLProtocol.stubResponseHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        guard let publisher = resultWrapper.mockPublisher(url: AppConst.baseUrl) else {
            XCTFail()
            return
        }
        
        let expectation = self.expectation(description: "Succesfull Response Expectation")
        
        //Act
        sut.searchCharacter(publisher) { character in
            //Assert
            XCTAssertNotNil(character)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testGetPeopleList_WhenGivenSuccesfullResponse_ShouldReturnNotNilCharacterList(){
        //Arrange
        var mockData:Data!
        
        do
        {
            mockData = try JSONEncoder().encode(characterList)
        }
        catch
        {
            XCTFail()
        }
        
        //Insert MockData
        MockURLProtocol.stubResponseHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        let expectation = self.expectation(description: "Succesfull Response Expectation")
        
        guard let publisher = resultWrapper.mockPublisher(url: AppConst.baseUrl) else {
            XCTFail()
            return
        }
        
        //Act
        sut.getPeopleList(publisher) { characterList in
            //Assert
            XCTAssertNotNil(characterList)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
}
