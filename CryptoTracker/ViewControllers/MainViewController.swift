//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Rustam Cherezbiev on 01.02.2024.
//

import UIKit

final class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoin()
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchCoin() {
        URLSession.shared.dataTask(with: urlApi) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            if let JSONString = String(data: data, encoding: .utf8) {
                print(JSONString)
            }
            
            do {
                let coin = try JSONDecoder().decode([Coin].self, from: data)
                print(coin)
            } catch {
                print(error)
            }
        }.resume()
    }
}
