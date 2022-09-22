//
//  StationModel.swift
//  AppleMusicTask
//
//  Created by Maksim Malofeev on 17/09/2022.
//

import Foundation

class StationModel: ObservableObject {
    @Published var stationModel = Station().createModel()
}
