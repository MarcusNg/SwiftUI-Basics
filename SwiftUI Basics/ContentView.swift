//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Marcus Ng on 6/22/19.
//  Copyright © 2019 Amarok Technologies Inc. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let username, message, imageName: String
}

struct ContentView : View {
    
    let users: [User] = [
        .init(id: 0, username: "Tim Cook", message: "I sell expensive things that look nice.", imageName: "shiba"),
        .init(id: 1, username: "Bobbert Bobbertson", message: "I sell expensive things that look nice. I sell expensive things that look nice.", imageName: "samoyed"),
        .init(id: 2, username: "Johnathan Ivey", message: "I sell expensive things that look nice. I sell expensive things that look nice. I sell expensive things that look nice. I sell expensive things that look nice.", imageName: "golden")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users.identified(by: \.id)) { user in
                    // User Row
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow : View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
//                .clipped()
            VStack (alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                Text(user.message)
                    .font(.subheadline)
                    .lineLimit(nil) // Dynamic cell height
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
