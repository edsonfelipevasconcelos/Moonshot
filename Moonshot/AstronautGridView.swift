import SwiftUI

struct AstronautGridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(astronauts.sorted(by: { $0.key < $1.key }), id: \.key) { astronaut in
                        NavigationLink {
                            AstronautView(astronaut: astronaut.value)
                        } label: {
                            VStack {
                                Image(astronaut.value.id)
                                    .resizable()
                                    .scaledToFill()
//                                    .frame(width: 160, height: 118)
                                    .clipShape(Circle())
                                    .padding()
                                VStack {
                                    Text(astronaut.value.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical)
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
                }
                .padding([.horizontal, .bottom])
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct AstronautGridView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautGridView()
    }
}
