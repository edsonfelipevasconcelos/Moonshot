//
//  MissionListView.swift
//  Moonshot
//
//  Created by EDSON FELIPE VASCONCELOS on 26/04/23.
//

import SwiftUI

struct MissionListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingDates = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Toggle(isOn: $showingDates) {
                Text("Show the date")
                    .font(.headline)
            }
            .padding()
            .background(.darkBackground)
            
            ScrollView {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            HStack {
                                Spacer()
                                
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                    .padding(.horizontal)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                    Text(showingDates ? mission.formattedLaunchDate : crewNames(actualMission: mission))
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(4)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
                .padding()
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

func crewNames(actualMission: Mission) -> String{
    var temp = [String]()
    for crewName in actualMission.crew{
        temp.append(crewName.name.capitalized)
    }
    
    return temp.joined(separator: ", ")
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
