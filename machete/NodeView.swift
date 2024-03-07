//
//  NodeView.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import SwiftUI

struct NodeView: View {
    var node: GoonNode;
    var depth: Int;
    var body: some View {
        VStack {
            if let value = node.value {
                ScarView(scar: value).padding(4)
            }
            VStack {
                ForEach(node.children) {
                    child in NodeView(node: child, depth: depth + 1)
                }
            }
        }
    }
}

#Preview {
    let ns = makeChatMsgNS(node: msgs[0])
    return VStack {
        NodeView(node: ns.node, depth: 0)
    }
}
