 //
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by Amaury A V A Souza on 30/03/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
// tutorial realizado em https://www.youtube.com/watch?v=-BZdQmHV4MQ

import SwiftUI

struct ContentView: View {
    //@Environment: wrapper que serve para trabalhar com predefined keys (??) como por exemplo um Core Data managed object context, se o device tá em dark ou light mode, em qual size class sua view tá sendo renderizada.
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest serve para trabalhar com Core Data Fetch Requests, é o que permite trazer os dados para a view sem lógica adicional. precisa do fetchrequest da entidade que vc criou no coredata e da variável com o tipo, o animation não precisa
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems(), animation: .default) var toDoItems:FetchedResults<ToDoItem>
    //não entendi o uso do state nesse código ainda
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's next?")){
                    HStack{
                        TextField("New Item", text: self.$newToDoItem )//o binding que eu tinha visto na wwdc! Mas não entendi exatamente para que foi usado aqui, preciso entender melhor, sei que está relacionado ao estate, e quando apaguei as duas coisas o programa parou de funcionar. A impressão que deu é só que é assim e pronto
                        
                        //botao salva os dados no contexto
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            //isso aqui é o que salva o conteúdo do contexto no coredata
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            //zera o que tá no field
                            self.newToDoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                                .imageScale(.large)
                            
                        }
                        //botoes podem ter imagens da forma acima! Não entendi muito bem ainda pq ele sugere uma função esquisitona se aceita dessa forma (que é bem esquisitona por si só também)
                        
                    }
                }
                .font(.headline)
                //force unwraps feios a seguir, arrumar isso
                //section exibe o que está no coredata
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems){toDoItem in
                        ToDoItemView(title: toDoItem.title ?? "erro", createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete { (indexSet) in
                        //não entendi de que forma funciona esse indexSet para deletar o first. Talvez por ser só um item por view?
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                     
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
