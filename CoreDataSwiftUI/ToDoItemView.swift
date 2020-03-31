//
//  ToDoItemView.swift
//  CoreDataSwiftUI
//
//  Created by Amaury A V A Souza on 31/03/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
//

import SwiftUI
//Essa view é uma célula da tableview
//Aqui eu parei o tutorial pra ir olhar o tutorial da apple de swiftUI e relembrar como transformar essa view em uma cell no preview, já que é tudo o que ela é
struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        //como as strings estão vazias, inicializo a view no preview com valores arbitrários para poder verificar o layout
        ToDoItemView(title: "Trabalhar na bridge", createdAt: "31/03")
            //faz com que seja o tamanho que fit o conteúdo (que se bem me lembro é o tamanho da célula do swiftUI, que faz tudo sozinho lindinho). Poderia ser também um tamanho fico com .previewLayout(.fixed(witdh: numero, height: numero))
            .previewLayout(.sizeThatFits)
        
    }
}
