//
//  Cell.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import UIKit

final class CoinCell: UITableViewCell {
    @IBOutlet var coinImageView: UIImageView!
    @IBOutlet var coinInfoLabel: UILabel!

    private let networkManger = NetworkManager.shared
    
    func configure(with coin: Coin) {
        coinInfoLabel.text = 
            """
            \(coin.symbol.uppercased()) - \(coin.name)
            Текущая цена: \(coin.currentPrice)$
            Максимум 24ч: \(coin.highTwentyFourHours)$
            Минимум 24ч: \(coin.lowTwentyFourHours) $
            """
        
        networkManger.fetchImage(from: URL(string: coin.image)!) { [unowned self] Result in
            switch Result {
            case .success(let imageData):
                coinImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
