import SwiftUI

struct ListaView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(programas) { programa in
                        NavigationLink {
                            ProgramaDetailView(programa: programa)
                        } label: {
                            ShowCard(programa: programa)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Programas")
        }
    }
}
