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
        fetchCoin()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Здесь добавить код обработки нажатия на ячейку
    }

}

// MARK: - Networking
extension MainViewController {
    private func fetchCoin() {
        networkManger.fetch([Coin].self, from: networkManger.urlApi) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let coins):
                self.coins = coins
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
