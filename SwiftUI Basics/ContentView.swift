//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Marcus Ng on 6/22/19.
//  Copyright © 2019 Amarok Technologies Inc. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
