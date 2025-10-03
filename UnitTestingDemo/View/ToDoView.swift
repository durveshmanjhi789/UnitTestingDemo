//
//  ToDoView.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//


import SwiftUI

struct ToDoView:View{
    @StateObject private var vm = ToDoViewModel(service: ToDoFactoryMethod())
    @State private var nameInput:String = ""
    var body:some View{
        VStack{
            List(vm.tasks){item in
                Text(item.name)
                
            }
            HStack{
                TextField("Enter Name", text: $nameInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button{
                    vm.addTask(nameInput)
                    nameInput = ""
                }label:{
                    Text("Add Name")
                }
                .padding()
                
            }
            ScrollView{
                VStack{
                    Text("timer start run loop default : \(vm.timer)")
                    Text("timer start run loop common : \(vm.timerCommon)")
                        
                }
                Group{
                    if let data = vm.imageData,let uiimage = UIImage(data: data) {
                        Image(uiImage:uiimage)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                    }else if vm.isLoading{
                        ProgressView()
                    }
                }
            }
          
          
        }
    }
}
