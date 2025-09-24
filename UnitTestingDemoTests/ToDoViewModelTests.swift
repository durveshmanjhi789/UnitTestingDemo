//
//  ToDoViewModelTests.swift
//  UnitTestingDemoTests
//
//  Created by Durvesh Manjhi on 24/09/25.
//

import XCTest
@testable import UnitTestingDemo
final class ToDoViewModelTests: XCTestCase {

    private var sut: ToDoViewModel!
    
    override func setUp() {
        //initial method called
        super.setUp()
        sut = ToDoViewModel()
    }
    
    override func tearDown() {
        //when claass complete ttheir task
        sut = nil
        super.tearDown()
    }
    
    func test_addTask(){
        //Arrange
        let newTask = "sushil"
        let count = sut.tasks.count
        
        //act
        sut.addTask(newTask)
        
        //assert
        
        XCTAssertEqual(sut.tasks.count, count + 1)
        XCTAssertEqual(sut.tasks.last?.name, newTask )
        
    }
    
    func test_addTask_withEmptyName(){
        //Arrange
       
        let count = sut.tasks.count
        //act
        sut.addTask("")
        
        //assert
        
        XCTAssertEqual(sut.tasks.count, count )
        //XCTAssertEqual(sut.tasks.last?.name, "" )
        
    }
    
}
