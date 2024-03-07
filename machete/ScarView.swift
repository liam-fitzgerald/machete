//
//  ScarView.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import SwiftUI

struct ScarView: View {
    var scar: Scar;
    var body: some View {
        switch scar {
        case .ship(let value):
            Text(value)
        case .text(let value):
            Text(value)
        case .icon(let type):
            Image(systemName: type.toSystemName())
        case .img(let img):
            AsyncImage(url: URL(string: img.url)).frame(width: CGFloat(img.width), height: CGFloat(img.height))
        }
        
    }
}

#Preview {
    VStack {
        ForEach(scarExamples) {
            scar in ScarView(scar: scar)
        }
    }
}
