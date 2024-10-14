//
//  MainViewModel.swift
//  ToDosApp
//
//  Created by Kasım on 26.05.2024.
//

import Foundation
import RxSwift

class MainViewModel {
    var toDosRepo = ToDosDaoRepository()
    var toDosList = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    
    init(){//Sınıftan nesne oluşturulduğunda çalışır.
        toDosList = toDosRepo.toDosList
    }
    
    func delete(toDo:ToDosModel){
        toDosRepo.delete(toDo: toDo)
        loadToDos()
    }
    
    func search(searchText:String){
        toDosRepo.search(searchText: searchText)
    }
    
    func loadToDos(){
        toDosRepo.loadToDos()
    }
}
