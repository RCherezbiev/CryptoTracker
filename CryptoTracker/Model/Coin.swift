//
//  Coin.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import Foundation

// MARK: - AgentElement
struct Coin {
    let image: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let highTwentyFourHours: Double
    let lowTwentyFourHours: Double
    
    init(image: String, symbol: String, name: String, currentPrice: Double, highTwentyFourHours: Double, lowTwentyFourHours: Double) {
        self.image = image
        self.symbol = symbol
        self.name = name
        self.currentPrice = currentPrice
        self.highTwentyFourHours = highTwentyFourHours
        self.lowTwentyFourHours = lowTwentyFourHours
    }
    
    init(coinDetail: [String: Any]) {
        image = coinDetail["image"] as? String ?? ""
        symbol = coinDetail["symbol"] as? String ?? ""
        name = coinDetail["name"] as? String ?? ""
        currentPrice = coinDetail["current_price"] as? Double ?? 0.0
        highTwentyFourHours = coinDetail["high_24h"] as? Double ?? 0.0
        lowTwentyFourHours = coinDetail["low_24h"] as? Double ?? 0.0
    }
    
    static func getCoins(from value: Any) -> [Coin] {
        guard let coinsDetails = value as? [[String: Any]] else { return [] }
        return coinsDetails.map { Coin(coinDetail: $0) }
    }
    
}
