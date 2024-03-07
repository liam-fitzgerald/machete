//
//  GoonNode.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation

struct TextScar {
    let value: String;
}

struct ImgScar {
    let url: String;
    let width: Int;
    let height: Int;
}

enum IconScarType {
    case chat
    case unread
    
    func toSystemName() -> String {
        switch self {
        case .chat:
            return "message"
        case .unread:
            return "circle.fill"
        }
        
    }
    
    func toString() -> String {
        switch self {
        case .chat:
            return "chat"
        case .unread:
            return "unread"
        }
    }
}

enum Scar: Identifiable {
    
    case text(value: String)
    case ship(value: String)
    case icon(type: IconScarType)
    case img(img: ImgScar)
    var id: String {
        self.toString()
    }
    
    func toString() -> String {
        switch self {
        case .icon(let type):
            return type.toString()
        case .text(let value):
            return value;
        case .ship(let value):
            return value;
        case .img(let img):
            return "Image at url \(img.url)"
        }
    }
}

let scarExamples: [Scar] = [.text(value: "A demonstration message"), .ship(value: "~hastuc-dibtux"), .img(img: ImgScar(url: "https://fabled-faster.nyc3.cdn.digitaloceanspaces.com/tlon-locals.svg", width: 32, height: 32)), .icon(type: .chat)
]
    

struct GoonNode: Identifiable {
    let iota: Iota;
    let value: Scar?;
    let lede: String?;
    let info: String?;
    let children: [GoonNode]
    var id: String {
        return iota.toString()
    }
    
}

struct GoonPreview: Identifiable {
    let icon: Scar?;
    let title: Scar;
    let badge: Scar?;
    var id: String {
        return "\(icon?.id ?? "")-\(title.id)-\(badge?.id ?? "")"
    }
}

let prevExamples = [GoonPreview(icon: .icon(type: .chat), title: .text(value: "UF internal"), badge: nil)]


//


let nodeExamples = [GoonNode(iota: TasIota(value: "demo"), value: .text(value: "Test"), lede: "Title", info: "Description", children: [])]

let now = Date()
func makeChatMessage(content: String, ship: String, minutes: Int) -> GoonNode? {
    guard let date = Calendar.current.date(byAdding: .minute, value: minutes, to: now) else {
        return nil
    }
    let id = DateIota(value: date);
    return GoonNode(iota: id, value: .text(value: content), lede: "Message", info: nil, children: [
        GoonNode(iota: TasIota(value: "author"), value: .text(value: ship), lede: "Author", info: nil, children: []),
        GoonNode(iota: TasIota(value: "date"), value: .text(value: date.formatted()), lede: "Date sent", info: nil, children: [])
    ])
}



let exShips = [
    "~hastuc-dibtux",
    "~rovnys-ricfer",
    "~tondes-sitrym",
    "~sarpen-laplux",
]

