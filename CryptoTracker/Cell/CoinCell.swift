//
//  Cell.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import UIKit

final class CoinCell: UITableViewCell {
    @IBOutlet var coinImageView: UIImageView!
    @IBOutlet var coinNameLabel: UILabel!
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var coinPriceLabel: UILabel!
    @IBOutlet var highPerDayLabel: UILabel!
    @IBOutlet var lowPerDayLabel: UILabel!
    
    private let networkManger = NetworkManager.shared
    
    func configure(with coin: Coin) {
        coinNameLabel.text = (coin.name)
        symbolLabel.text = coin.symbol.uppercased()
        coinPriceLabel.text = "Текущая цена: \(coin.currentPrice) $"
        highPerDayLabel.text = "Максимум 24ч: \(coin.highTwentyFourHours) $"
        lowPerDayLabel.text = "Минимум 24ч: \(coin.lowTwentyFourHours) $"
        
        networkManger.fetchImage(from: coin.image) { [unowned self] Result in
            switch Result {
            case .success(let imageData):
                coinImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
