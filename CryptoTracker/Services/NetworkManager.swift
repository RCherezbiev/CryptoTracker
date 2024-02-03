//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 03.02.2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    let urlApi = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
}
