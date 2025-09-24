//
//  ToDoView.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//


import SwiftUI

struct ToDoView:View{
    @StateObject private var vm = ToDoViewModel()
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
        }
    }
}
