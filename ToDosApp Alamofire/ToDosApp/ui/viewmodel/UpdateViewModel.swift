//
//  UpdateViewModel.swift
//  ToDosApp
//
//  Created by Kasım on 26.05.2024.
//

import Foundation
 
class UpdateViewModel {
    var toDosRepo = ToDosDaoRepository()
    
    func update(id:Int,name:String){
        toDosRepo.update(id: id, name: name)
    }
}
