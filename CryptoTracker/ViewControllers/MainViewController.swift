//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import UIKit

final class MainViewController: UITableViewController {
    
    private var coins: [Coin] = []

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
}

// MARK: - Networking
extension MainViewController {
    private func fetchCoin() {
        URLSession.shared.dataTask(
            with: NetworkManager.shared.urlApi
        ) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error ?? "No error description")
                return
            }
            
            do {
                self.coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
