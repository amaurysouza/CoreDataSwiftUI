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
    static func getAllToDoItems()-> NSFetchRequest<ToDoItem>{
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDesciptor = NSSortDescriptor(key:"createdAt", ascending: true)
        
        request.sortDescriptors = [sortDesciptor]
        
        return request
    }
}
