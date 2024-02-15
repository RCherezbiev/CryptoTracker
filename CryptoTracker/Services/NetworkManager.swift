//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 03.02.2024.
//

import Foundation
import Alamofire

enum Link {
    case apiURL
    
    var url: URL {
        switch self {
        case .apiURL:
            return URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, AFError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(AFError.parameterEncodingFailed(reason: .missingURL)))
                print(completion)
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchCoins(from url: URL, completion: @escaping(Result<[Coin], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let coins = Coin.getCoins(from: value)
                    completion(.success(coins))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
    }
}
