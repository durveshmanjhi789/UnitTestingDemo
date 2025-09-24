//
//  ToDoViewModelTests.swift
//  UnitTestingDemoTests
//
//  Created by Durvesh Manjhi on 24/09/25.
//


import XCTest
@testable import UnitTestingDemo


class MockToDoService: ToDoServiceProtocol {
    func fetchTask() -> [UnitTestingDemo.ToDoModel] {
        return [
            ToDoModel(name: "Mock Task")
        ]
    }

}


final class ToDoViewModelTests: XCTestCase {

    private var sut: ToDoViewModel!
    
    override func setUp() {
        //initial method called
        super.setUp()
        sut = ToDoViewModel(service: MockToDoService())
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
    
    func test_vm_mock_data(){
        
        //arrange
        let mock = MockToDoService()
        let service = ToDoViewModel(service: mock)
        //act
        
        //assert
        
        XCTAssertEqual(sut.tasks.count, 1)
        XCTAssertEqual(sut.tasks.last?.name, service.tasks.last?.name)
        
    }
    
}
