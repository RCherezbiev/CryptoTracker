//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import UIKit

final class MainViewController: UITableViewController {
    
    private var coins: [Coin] = []
    
    private let networkManger = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoins()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath)
        guard let cell = cell as? CoinCell else { return UITableViewCell() }
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    private func fetchCoins() {
        networkManger.fetchCoins(from: Link.apiURL.url) { [unowned self] result in
            switch result {
            case .success(let coins):
                self.coins = coins
                tableView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
