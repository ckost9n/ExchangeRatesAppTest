//
//  ValuteCell.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import UIKit

class ValuteCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
    @IBOutlet var imageRate: UIImageView!

    func configure(with valute: Valute) {
        nameLabel.text = valute.charCode
        valueLabel.text = "\(valute.value)"
        if valute.value < valute.previousValue {
            let currentValue = valute.previousValue - valute.value
            rateLabel.text = "+\(currentValue)"
            imageRate.image = UIImage(systemName: "arrowtriangle.up.fill")
            imageRate.tintColor = .green
        } else {
            let currentValue = valute.previousValue - valute.value
            rateLabel.text = "\(currentValue)"
            imageRate.image = UIImage(systemName: "arrowtriangle.down.fill")
            imageRate.tintColor = .red
        }
    }

}
