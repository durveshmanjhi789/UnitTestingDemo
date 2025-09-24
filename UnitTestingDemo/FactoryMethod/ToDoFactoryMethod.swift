//
//  ToDoFactoryMethod.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//

class ToDoFactoryMethod:ToDoServiceProtocol{
    func fetchTask() -> [ToDoModel] {
        return [
            ToDoModel(name: "duvesh"),
            ToDoModel(name: "kamal")
        ]
    }
}
