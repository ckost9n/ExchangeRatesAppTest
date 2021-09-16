//
//  MainValuteTableViewController.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import UIKit

class MainValuteTableViewController: UITableViewController {
    
    var valutes: [Valute] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.fetchData { exchange in
            let valutesDict = Array(exchange.valute.values)
            self.valutes = valutesDict
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valutes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valuteCell", for: indexPath) as! ValuteCell

        let valuteCell = valutes[indexPath.row]
        cell.configure(with: valuteCell)

        return cell
    }

}
