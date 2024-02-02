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
    
    func configure(with coin: Coin) {
        coinNameLabel.text = "Актив: \(coin.name)"
        symbolLabel.text = "Символ: \(coin.symbol)"
        coinPriceLabel.text = "Текущая цена: \(coin.current_price) $"
        
        guard let imageData = try? Data(contentsOf: URL(string: coin.image)!) else { return }
        coinImageView.image = UIImage(data: imageData)
    }
}
