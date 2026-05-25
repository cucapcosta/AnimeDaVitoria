import SwiftUI

struct Programa: Identifiable {
    let id = UUID()
    let nome: String
    let tipo: String
    let emoji: String
    let genero: String
    let sinopse: String
    let episodios: Int
    let temporadas: Int
    let avaliacao: Double
    let status: String
    let cor: Color
    let personagens: [(String, String, String)]
}

let programas = [

    Programa(
        nome: "Attack on Titan",
        tipo: "Anime",
        emoji: "shield.lefthalf.filled",
        genero: "Ação • Drama",
        sinopse: "SASAGEYO!!!",
        episodios: 89,
        temporadas: 4,
        avaliacao: 4.9,
        status: "Concluído",
        cor: .brown,
        personagens: [
            ("Eren", "Daddy/Mommy Issues", "flame.fill"),
            ("Mikasa", "Eren Issues", "heart.fill"),
            ("Levi", "Everybody Issues", "bolt.fill")
        ]
    ),

    Programa(
        nome: "Demon Slayer",
        tipo: "Anime",
        emoji: "flame.fill",
        genero: "Ação • Sobrenatural",
        sinopse: "NEZUKO-CHAAAAANNN!",
        episodios: 55,
        temporadas: 4,
        avaliacao: 4.8,
        status: "Em andamento",
        cor: .red,
        personagens: [
            ("Tanjiro", "Espadinha Preta", "sun.max.fill"),
            ("Nezuko", "O Demônio em Questão", "moon.fill"),
            ("Zenitsu", "Espadinha de Raio", "bolt.fill")
        ]
    ),

    Programa(
        nome: "One Piece",
        tipo: "Anime",
        emoji: "sailboat.fill",
        genero: "Aventura • Fantasia",
        sinopse: "O cara estica aí...",
        episodios: 1100,
        temporadas: 20,
        avaliacao: 5.0,
        status: "Em andamento",
        cor: .orange,
        personagens: [
            ("Luffy", "Capintão", "face.smiling.fill"),
            ("Zoro", "Zé das Espadinhas", "sword.fill"),
            ("Nami", "Sabe usar um Mapa", "cloud.sun.fill")
        ]
    )
]
