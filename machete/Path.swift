//
//  Path.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation

struct UPath: Identifiable, Hashable {
    let value: [String];
    var len: Int {
        return value.count
    }
    var string: String  {
        return "/\(value.joined(separator: "/"))"
    }
    var first: String? {
        return value.first
    }
    var id: String {
        return self.string
    }
    init(fromStr: String) {
        self.value = Array(fromStr.split(separator: "/")).map(String.init)
    }
    init(raw: [String]) {
        self.value = raw
    }
    init(ship: String) {
        self.value = [ship]
    }
    
    func append(_ segment: String) -> UPath {
        let new = self.value + [segment]
        return UPath(raw: new)
    }
    
    
    func descendants(_ candidates: [UPath]) -> [UPath] {
        return candidates.filter({
            opt in
            let pfx = opt.value.prefix(upTo: self.len)
            return pfx.elementsEqual(self.value)
        })
    }
    func children(_ candidates: [UPath]) -> [UPath] {
        return candidates.filter({
            opt in
            let pfx = opt.value.prefix(upTo: self.len)
            return (opt.len == self.len + 1) && pfx.elementsEqual(self.value)
        })
    }
    
    static func === (lhs: UPath, rhs: UPath) -> Bool {
        return lhs.value.elementsEqual(rhs.value)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
    
    static func empty() -> UPath {
        UPath(raw: [])
    }
    

}
