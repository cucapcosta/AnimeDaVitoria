import SwiftUI

struct ShowCard: View {
    let programa: Programa
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(programa.cor)
                .frame(width: 6)
            RoundedRectangle(cornerRadius: 12)
                .fill(programa.cor.opacity(0.2))
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: programa.emoji)
                        .font(.title2)
                }
            VStack(alignment: .leading, spacing: 4) {
                Text(programa.tipo)
                    .font(.caption)
                Text(programa.nome)
                    .font(.headline)
                Text(programa.genero)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("⭐ \(String(format: "%.1f", programa.avaliacao))")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }
}
