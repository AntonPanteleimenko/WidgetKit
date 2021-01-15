//
//  CovidModel.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

public struct JSONModel: Decodable, Hashable {
    
    let country: String
    let code: String
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    let latitude: Float
    let longitude: Float
    let lastChange: String
    let lastUpdate: String
}
