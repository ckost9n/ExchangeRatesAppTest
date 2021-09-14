//
//  MainValuteTableViewController.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import UIKit

class MainValuteTableViewController: UITableViewController {
    
    private let urlValute = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    var valutes: [Valute] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getValue()
//        tableView.reloadData()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return valutes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valuteCell", for: indexPath) as! ValuteCell

        let valuteCell = valutes[indexPath.row]
        cell.configure(with: valuteCell)

        return cell
    }
    
    
    func getValue() {
        
        guard let url = URL(string: urlValute) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let valutesJson = try JSONDecoder().decode(Excahnge.self, from: data)
                DispatchQueue.main.async {
                    let valutesDict = Array(valutesJson.valute.values)
                    self.valutes = valutesDict
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
