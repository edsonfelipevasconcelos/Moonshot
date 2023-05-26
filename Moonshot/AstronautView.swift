//
//  AstronautView.swift
//  Moonshot
//
//  Created by EDSON FELIPE VASCONCELOS on 25/04/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missionsFlown: [String]
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        var matches = [String]()
        
        for mission in missions {
            for _ in mission.crew {
                if let match = mission.crew.first(where: {$0.name == astronaut.id}) {
                    matches.append("Apollo \(mission.id)\n \(match.role)")
                    break
                }
            }
        }
        self.missionsFlown = matches
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                ForEach(self.missionsFlown, id: \.self) { mission in
                    VStack {
                        Text(mission.description)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top)
                }
                    
                LineDivider()
                
                Text(astronaut.description)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .background(.darkBackground)
        .navigationBarTitle(Text(self.astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
