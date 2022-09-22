import Foundation

struct Station: Identifiable {
    var id = UUID()
    var text: String
    var subText: String
    var imageName: String

    init(text: String = "", subText: String = "",imageName: String = "") {
        self.text = text
        self.subText = subText
        self.imageName = imageName
    }

    func createModel() -> [Station] {
        [Station(text: "Популярное", subText: "То, что сейчас слушают.", imageName: "Популярное радио"),
         Station(text: "Музыка для расслабления", subText: "Электронная медитация.", imageName: "Для расслабления"),
         Station(text: "Классика", subText: "Выдающиеся образцы жанра", imageName: "Классика"),
         Station(text: "Поп", subText: "То, что сейчас слушают.", imageName: "Поп"),
         Station(text: "Альтернатива", subText: "Электронная медитация.", imageName: "Альтернатива"),
         Station(text: "Хип-хоп на русском", subText: "Выдающиеся образцы жанра", imageName: "Хип-хоп"),
         Station(text: "Рок", subText: "То, что сейчас слушают.", imageName: "Рок"),
         Station(text: "Электронная музыка", subText: "Электронная медитация.", imageName: "Электронная"),
         Station(text: "Джаз", subText: "Выдающиеся образцы жанра", imageName: "Джаз")
        ]
    }

}
