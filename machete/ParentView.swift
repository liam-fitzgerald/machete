//
//  ParentView.swift
//  machete
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import SwiftUI

struct ParentView: View {
    var content: GoonPreview;
    var body: some View {
        HStack {
            if let icon = content.icon {
                ScarView(scar: icon)
            }
            ScarView(scar: content.title)
            if let badge = content.badge {
                ScarView(scar: badge)
            }
        }
    }
}

#Preview {
    VStack {
        ForEach(prevExamples) {
            prev in ParentView(content: prev)
        }
        
    }
}
