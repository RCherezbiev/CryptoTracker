//
//  Coin.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import Foundation

// MARK: - AgentElement
struct Coin: Codable {
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
    let image: String
}

let urlApi = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
