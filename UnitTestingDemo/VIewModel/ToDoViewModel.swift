//
//  ToDoViewModel.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//


import Combine
class ToDoViewModel:ObservableObject{
    private var service:ToDoServiceProtocol
    @Published var tasks:[ToDoModel] = []
    
    init(service: ToDoServiceProtocol) {
        self.service = service
        self.tasks = service.fetchTask()
    }
    
    
    func addTask(_ name:String){
        guard !name.isEmpty else { return }
        let myvm = ToDoModel(name: name)
        tasks.append(myvm)
    }
    
}
