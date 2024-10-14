//
//  ToDos.swift
//  ToDosApp
//
//  Created by Kasım on 25.05.2024.
//

import Foundation

class ToDos : Codable {
    var id:Int?
    var name:String?
    
    init(id: Int, name: String) {
        self.id = id//Shadowing
        self.name = name
    }
}


