//
//  UrbitNS.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation

struct UrbitNS {
    let node: GoonNode;
    let prev: GoonPreview;
}



func makeCopyNS(lede: String, info: String) -> UrbitNS {
    let node = GoonNode(iota: TasIota(value: ""), value: nil, lede: lede, info: info, children: [])
    let prev = GoonPreview(icon: nil, title: .text(value: lede), badge: nil)
    return UrbitNS(node: node, prev: prev)
}

func makeChatMsgNS(node: GoonNode) -> UrbitNS {
    return UrbitNS(node: node, prev: GoonPreview(icon: nil, title: .text(value: "Chat message"), badge: nil))
}


   

