//
//  ContentView.swift
//  Moonshot
//
//  Created by EDSON FELIPE VASCONCELOS on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    MissionGridView()
                } else {
                    MissionListView()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                showingGrid.toggle()
            }, label: {
                Text(showingGrid ? "List" : "Grid")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
