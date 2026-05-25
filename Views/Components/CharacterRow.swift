import SwiftUI

struct CharacterRow: View {

    let nome: String
    let papel: String
    let emoji: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: emoji)
                .font(.title2)
            VStack(alignment: .leading) {
                Text(nome)
                    .font(.headline)
                Text(papel)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
