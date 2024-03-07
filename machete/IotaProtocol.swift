//
//  IotaProtocol.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import Foundation

struct TasIota: Iota {
    let aura = "tas"
    let value: String;
    func toString() -> String {
        value
    }
}

struct DateIota: Iota {
    let aura = "da"
    let value: Date;
    func toString() -> String {
        value.ISO8601Format()
    }
}

protocol Iota {
    var aura: String { get }
    func toString() -> String
}

extension String: Identifiable {
    public var id: String { self }
}
