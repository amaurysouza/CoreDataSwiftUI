 //
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by Amaury A V A Souza on 30/03/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
// tutorial realizado em https://www.youtube.com/watch?v=-BZdQmHV4MQ

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems(), animation: .default) var toDoItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
