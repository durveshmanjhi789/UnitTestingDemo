//
//  ToDoViewModel.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//
import SwiftUI
class ToDoViewModel:ObservableObject{
    
    @Published var tasks:[ToDoModel] = [
        ToDoModel(name: "durvesh"),
        ToDoModel(name: "kamal")
    ]
    
    func addTask(_ name:String){
        guard !name.isEmpty else { return }
        let myvm = ToDoModel(name: name)
        tasks.append(myvm)
    }
    
}
