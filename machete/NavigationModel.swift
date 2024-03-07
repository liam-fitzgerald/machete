//
//  NavigationModel.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation


import SwiftUI
import Combine

struct Route {
    var ship: String;
    var path: UPath;
    
    
}

class NavigationModel: Identifiable, ObservableObject {
    let id = UUID()
    @Published var ship: String;
    @Published var path: UPath;
    
    private var cancellables: [AnyCancellable] = []
   
    var columnVisibility: NavigationSplitViewVisibility
    

    init(columnVisibility: NavigationSplitViewVisibility = .automatic,
         ship: String,
         path: UPath
    ) {
        self.columnVisibility = columnVisibility
        self.ship = ship
        self.path = path
        $ship.sink(receiveValue: {
            string in
            print(string)
        }).store(in: &cancellables)
        $path.sink(receiveValue: {
            pat in
            print(pat.string)
        }).store(in: &cancellables)

    }
}
