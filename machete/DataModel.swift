//
//  DataModel.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation
import SwiftUI
import Combine

@Observable class DataModel {
    var nodes: [String: [UPath: UrbitNS]] = [:]

    private var cancellables: [AnyCancellable] = []

    static let shared: DataModel = DataModel()

    private init() {
        nodes = initNodes
    }
    
    var ships: [String] {
        return Array(nodes.keys).compactMap({ $0 })
    }
    
    
    func children(ship: String, path: UPath) -> [UPath] {
        guard let s = nodes[ship] else {
            return []
        }
        return path.children(Array(s.keys))
    }
    
    func byPath(ship: String, path: UPath) -> UrbitNS? {
        guard let s = nodes[ship] else {
            return nil
        }
        return s[path]
    }
}

let msgs =    [
    makeChatMessage(content: "Test message one", ship: "~hastuc-dibtux", minutes: -50)!,
    makeChatMessage(content: "Test message two", ship: "~rovnys-ricfer", minutes: -40)!
]
let hastucNodes: [UPath: UrbitNS] = [
        UPath(fromStr: "/uf-internal"): makeCopyNS(lede: "UF Internal Group", info: ""),
        UPath(fromStr: "/blimp-chat"): makeCopyNS(lede: "BLIMPS!", info: ""),
        UPath(fromStr: "/uf-internal/general"): makeCopyNS(lede: "UF General Chat", info: ""),
        UPath(fromStr: "/uf-internal/comms"): makeCopyNS(lede: "UF Comms Chat", info: ""),
        UPath(fromStr: "/uf-general/general/1"): makeChatMsgNS(node: msgs[0]),
        UPath(fromStr: "/uf-general/general/2"): makeChatMsgNS(node: msgs[1])
]

let initNodes: [String: [UPath: UrbitNS]] = [
    "~hastuc-dibtux": hastucNodes
]
