//
//  ToDoItem.swift
//  CoreDataSwiftUI
//
//  Created by Amaury A V A Souza on 30/03/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    
}

extension ToDoItem{
    //ainda é magia negra pra mim, mas entendo que ele tá construindo um request e voltando como um vetor de ToDoItem, além de escolher uma key para ordenar e ordenar de acordo com ela. Entendi também que pra se trabalhar com o foreach tem que usar o protocol Identifiable, e o NsManagedObject é para o que for usar CoreData
    static func getAllToDoItems()-> NSFetchRequest<ToDoItem>{
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDesciptor = NSSortDescriptor(key:"createdAt", ascending: true)
        
        request.sortDescriptors = [sortDesciptor]
        
        return request
    }
}
