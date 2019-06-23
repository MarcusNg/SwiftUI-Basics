//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Marcus Ng on 6/22/19.
//  Copyright © 2019 Amarok Technologies Inc. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, imageName: String
}

struct Group {
    let id: Int
    let name, imageName: String
    
    static let sampleGroups: [Group] = [
        .init(id: 0, name: "Best of Shibes", imageName: "shibe"),
        .init(id: 1, name: "Best of Goldens", imageName: "golden"),
        .init(id: 2, name: "Best of Shoobies", imageName: "samoyed"),
        .init(id: 3, name: "Best of Shiba Pups", imageName: "shibapup"),
        .init(id: 4, name: "Best of Doggos", imageName: "dog")
    ]
}

struct FBGroupsView : View {
    let posts: [Post] = [
        .init(id: 0, username: "Sachi", text: "This pupper is almost as cute as me! I'm going to steal him right now...", imageName: "samoyed"),
        .init(id: 1, username: "Sachi", text: "This pupper is almost as cute as me! I'm going to steal him right now...", imageName: "samoyed"),
        .init(id: 2, username: "Sachi", text: "This pupper is almost as cute as me! I'm going to steal him right now...", imageName: "samoyed"),
        .init(id: 3, username: "Sachi", text: "This pupper is almost as cute as me! I'm going to steal him right now...", imageName: "samoyed")
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    Text("Trending")
                        .font(.headline)
                        .padding(.leading, 16).padding(.bottom, 4)
                    ScrollView (showsHorizontalIndicator: false) {
                        VStack (alignment: .leading) {
                            HStack {
                                ForEach(Group.sampleGroups.identified(by: \.id)) { group in
                                    NavigationButton(destination: GroupDetailView(group: group)) {
                                        GroupView(group: group)
                                            .padding(.trailing, 8)
                                    }
                                }
                                }.padding(.leading, 16).padding(.trailing, 8)
                        }
                        }.frame(height: 180)
                    }.padding(.top, 8).padding(.leading, -20).padding(.trailing, -20)
                
                // Post Rows
                ForEach(posts.identified(by: \.id)) { post in
                    PostView(post: post).padding(.bottom)
                }
                }.navigationBarTitle(Text("Groups"), displayMode: .automatic)
        }
    }
}

struct GroupDetailView: View {
    let group: Group
    
    var body: some View {
        VStack {
            Image(group.imageName)
            Text(group.name)
            }.navigationBarTitle(Text(group.name))
    }
}

struct GroupView: View {
    let group: Group
    
    var body: some View {
        VStack (alignment: .center) {
            Image(group.imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
//                .clipShape(Circle())
                .clipped()
            Text(group.name)
                .font(.headline)
                .color(.primary)
                .lineLimit(2)
                .frame(width: 100, height: 50)
            }.frame(width: 120, height: 170)
    }
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("shiba")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.username)
                        .font(.headline)
                    Text("Posted 2 hrs ago").font(.subheadline)
                    }.padding(.leading, 8)
                }.padding(.leading, 16).padding(.top, 16)
            
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 16).padding(.trailing, 16)
            Image(post.imageName, bundle: nil)
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            }.padding(.leading, -20).padding(.trailing, -20).padding(.top, 12).padding(.bottom, -26)
    }
}


// =======================================================


struct User: Identifiable {
    var id: Int
    let username, message, imageName: String
}

struct DynamicListView : View {
    
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
        FBGroupsView()
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}
#endif
