//
//  ItemCell.swift
//  bestBuyAppPractice
//
//  Created by Tony Cioara on 5/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSKU: UILabel!
    @IBOutlet weak var labelSalePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(fetchedItem: FetchedItem) {
        itemImageView.kf.setImage(with: fetchedItem.image)
        labelSKU.text = String(fetchedItem.sku)
        labelName.text = fetchedItem.name
        labelSalePrice.text = String(fetchedItem.salePrice)
    }

}
