//
//  ContentView.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    private var parents = ["Foo", "bar"];
    @State private var siblings = [];
    @State private var kids = [];
    
    var body: some View {
        Text("Test")
//        NavigationSplitView(sidebar: List(parents) {
//            parent in Text(parent)
//        } content: {
//            Text("foo")
//            
//        }, detail: List(kids) {
//            kid in Text(kid)
//        }
   }
}

#Preview {
    ContentView()
}
