import Foundation

struct RadioModel: Identifiable {
    var id = UUID()
    var topText: String
    var middleText: String
    var bottomText: String
    var imageName: String

    init(topText: String = "",
         middleText: String = "",
         bottomText: String = "",
         imageName: String = "") {
        self.topText = topText
        self.middleText = middleText
        self.bottomText = bottomText
        self.imageName = imageName
    }

    func createModel() -> [RadioModel] {
        [RadioModel(topText: "Новый выпуск",
                    middleText: "Музыкальный базар с Бастой",
                    bottomText: "Новое шоу",
                    imageName: "Баста"),
         RadioModel(topText: "Избранная радиостанция",
                    middleText: "Только поп-музыка",
                    bottomText: "Все топ-хиты",
                    imageName: "Поп-музыка"),
         RadioModel(topText: "Избранная радиостанция",
                    middleText: "Поп-музыка для тренировок",
                    bottomText: "Вперед с музыкой!",
                    imageName: "Для тренировок"),
         RadioModel(topText: "Избранная радиостанция",
                    middleText: "Танцевальная музыка",
                    bottomText: "Современные и будующие хиты",
                    imageName: "Танцевальная музыка")
        ]
    }

}
