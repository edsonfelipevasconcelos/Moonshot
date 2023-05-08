//
//  LineDivider.swift
//  Moonshot
//
//  Created by EDSON FELIPE VASCONCELOS on 25/04/23.
//

import SwiftUI

struct LineDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct LineDivider_Previews: PreviewProvider {
    static var previews: some View {
        LineDivider()
    }
}
