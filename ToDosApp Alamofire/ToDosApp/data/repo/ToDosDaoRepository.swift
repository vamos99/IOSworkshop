//
//  ToDosDaoRepository.swift
//  ToDosApp
//
//  Created by Kasım on 26.05.2024.
//

import Foundation
import RxSwift
import Alamofire

class ToDosDaoRepository {
    var toDosList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    func save(name:String){
        let url = "http://kasimadalan.pe.hu/toDos/insert.php"
        let parameters:Parameters = ["name":name]
        
        AF.request(url,method: .post,parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let crudResponse = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(crudResponse.success!)")
                    print("Message : \(crudResponse.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func update(id:Int,name:String){
        let url = "http://kasimadalan.pe.hu/toDos/update.php"
        let parameters:Parameters = ["id":id,"name":name]
        
        AF.request(url,method: .post,parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let crudResponse = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(crudResponse.success!)")
                    print("Message : \(crudResponse.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(id:Int){
        let url = "http://kasimadalan.pe.hu/toDos/delete.php"
        let parameters:Parameters = ["id":id]
        
        AF.request(url,method: .post,parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let crudResponse = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(crudResponse.success!)")
                    print("Message : \(crudResponse.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(searchText:String){
        let url = "http://kasimadalan.pe.hu/toDos/search.php"
        let parameters:Parameters = ["name":searchText]
        
        AF.request(url,method: .post,parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let toDosResponse = try JSONDecoder().decode(ToDosResponse.self, from: data)
                    if let list = toDosResponse.toDos {
                        self.toDosList.onNext(list)//Trigger - Tetikleme
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func loadToDos(){
        let url = "http://kasimadalan.pe.hu/toDos/getAllToDos.php"
        
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do{
                    let toDosResponse = try JSONDecoder().decode(ToDosResponse.self, from: data)
                    if let list = toDosResponse.toDos {
                        self.toDosList.onNext(list)//Trigger - Tetikleme
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
