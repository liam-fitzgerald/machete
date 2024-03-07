//
//  TreeNavView.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import SwiftUI

struct TreeNavView: View {
    @EnvironmentObject private var navModel: NavigationModel;
    var dataModel = DataModel.shared
    var body: some View {
        NavigationSplitView {
            List(dataModel.ships, selection: $navModel.ship) {
                s in Text(s)
            }
        } content: {
            List(dataModel.children(ship: navModel.ship, path: navModel.path), selection: $navModel.path) {
                pat in
                let node = dataModel.byPath(ship: navModel.ship, path: pat)!
                NavigationLink(node.prev.title.toString(), value: pat
                )
            }
        } detail: {
            ZStack {
                if let node = dataModel.byPath(ship: navModel.ship, path: navModel.path) {
//                                    Text("Tes")
                    NodeView(node: node.node, depth: 0)
                    
                } else {
                    Text("No node selected")
                }
            }
            
        }
    }
}

#Preview {
    let path = UPath(fromStr: "/")
    let obj = NavigationModel(columnVisibility: .all, ship: "~hastuc-dibtux", path: UPath(fromStr: "/uf-internal"))
    return TreeNavView().environmentObject(obj)

}
