//
//  ToDoViewModel.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//

import Foundation
import Combine
class ToDoViewModel:ObservableObject{
    private var service:ToDoServiceProtocol
    @Published var tasks:[ToDoModel] = []
    @Published var timer:Int = 0
    @Published var timerCommon:Int = 0
    @Published var isLoading : Bool = false
    @Published var imageData: Data?
    private var bag = Set<AnyCancellable>()
    
    init(service: ToDoServiceProtocol) {
        self.service = service
        self.tasks = service.fetchTask()
        createTimer()
        createTimerRunLoop()
    }
    func loadImage(){
        isLoading = true
        guard let url = URL(string: "https://picsum.photos/300/600") else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .replaceError(with: nil)
            .receive(on: RunLoop.main) // UI delay when intract with UI
            //.receive(on: DispatchQueue.main) // not any effect when we intract with ui
            .sink { [weak self] in
                if let data = $0{
                    self?.imageData = data
                }
            }
            .store(in: &bag)
    }
    
    func addTask(_ name:String){
        guard !name.isEmpty else { return }
        let myvm = ToDoModel(name: name)
        tasks.append(myvm)
    }
    
    func createTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .default)
    }
    func createTimerRunLoop(){
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runloopTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
    }
    @objc func updateTimer(){
        timer = timer + 1
    }
    @objc func runloopTimer(){
        timerCommon = timerCommon + 1
        if timerCommon == 5{
            loadImage()
        }
    }
}
