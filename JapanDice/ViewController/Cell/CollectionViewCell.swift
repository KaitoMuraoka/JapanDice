//
//  CollectionViewCell.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var dataName: UILabel!
    @IBOutlet weak var comparisonPreDay: UILabel!
    @IBOutlet weak var comparisonPreYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataName.adjustsFontSizeToFitWidth = true
    }

}
