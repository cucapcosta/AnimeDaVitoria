import SwiftUI

struct ProgramaDetailView: View {
    let programa: Programa
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(spacing: 12) {
                    Image(systemName: programa.emoji)
                        .font(.system(size: 60))
                    Text(programa.nome)
                        .font(.largeTitle)
                        .bold()
                    Text(programa.tipo)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(programa.cor.opacity(0.2))
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(programa.cor.opacity(0.2))

                VStack(alignment: .leading, spacing: 8) {
                    Text("Sinopse")
                        .font(.title2)
                        .bold()
                    Text(programa.sinopse)
                }
                .padding(.horizontal)

                HStack {
                    InfoBadge(
                        icon: "film.fill",
                        value: "\(programa.episodios)",
                        title: "Episódios",
                        color: .orange
                    )
                    InfoBadge(
                        icon: "square.stack.fill",
                        value: "\(programa.temporadas)",
                        title: "Temporadas",
                        color: .green
                    )
                    InfoBadge(
                        icon: "star.fill",
                        value: String(format: "%.1f", programa.avaliacao),
                        title: "Nota",
                        color: .blue
                    )
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Personagens")
                        .font(.title3)
                        .bold()
                    ForEach(programa.personagens, id: \.0) { personagem in

                        CharacterRow(
                            nome: personagem.0,
                            papel: personagem.1,
                            emoji: personagem.2
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
