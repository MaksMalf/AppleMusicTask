import SwiftUI

struct ModelCell: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isDedicated = false
    var imageName: String

    init(text: String = "", imageName: String = "") {
        self.text = text
        self.imageName = imageName
    }

    func createModel() -> [ModelCell] {
        [ModelCell(text: "Плейлисты", imageName: "music.note.list"),
         ModelCell(text: "Артисты", imageName: "music.note.list"),
         ModelCell(text: "Альбомы", imageName: "music.note.list"),
         ModelCell(text: "Песни", imageName: "music.note.list"),
         ModelCell(text: "Телешоу и фильмы", imageName: "music.note.list"),
         ModelCell(text: "Видеоклипы", imageName: "music.note.list"),
         ModelCell(text: "Жанры", imageName: "music.note.list"),
         ModelCell(text: "Сборники", imageName: "music.note.list"),
        ]
    }
}

