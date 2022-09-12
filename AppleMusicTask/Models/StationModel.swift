import Foundation

struct StationModel: Identifiable {
    var id = UUID()
    var text: String
    var subText: String
    var imageName: String

    init(text: String = "", subText: String = "",imageName: String = "") {
        self.text = text
        self.subText = subText
        self.imageName = imageName
    }

    func createModel() -> [StationModel] {
        [StationModel(text: "Популярное", subText: "То, что сейчас слушают.", imageName: "Популярное радио"),
         StationModel(text: "Музыка для расслабления", subText: "Электронная медитация.", imageName: "Для расслабления"),
         StationModel(text: "Классика", subText: "Выдающиеся образцы жанра", imageName: "Классика"),
         StationModel(text: "Популярное", subText: "То, что сейчас слушают.", imageName: "Популярное радио"),
         StationModel(text: "Музыка для расслабления", subText: "Электронная медитация.", imageName: "Для расслабления"),
         StationModel(text: "Классика", subText: "Выдающиеся образцы жанра", imageName: "Классика"),
         StationModel(text: "Популярное", subText: "То, что сейчас слушают.", imageName: "Популярное радио"),
         StationModel(text: "Музыка для расслабления", subText: "Электронная медитация.", imageName: "Для расслабления"),
         StationModel(text: "Классика", subText: "Выдающиеся образцы жанра", imageName: "Классика")
        ]
    }

}
