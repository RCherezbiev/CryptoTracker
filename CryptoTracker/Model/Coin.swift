//
//  Coin.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import Foundation

// MARK: - AgentElement
struct Coin: Decodable {
    let image: URL
    let symbol: String
    let name: String
    let currentPrice: Double
    let highTwentyFourHours: Double
    let lowTwentyFourHours: Double
    
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case symbol = "symbol"
        case name = "name"
        case currentPrice = "current_price"
        case highTwentyFourHours = "high_24h"
        case lowTwentyFourHours = "low_24h"
    }
}
