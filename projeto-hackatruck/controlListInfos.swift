//
//  controlListInfos.swift
//  projeto-hackatruck
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 organization. All rights reserved.
//

import UIKit

class controlListInfos: UITableViewCell {
    
    @IBOutlet weak var imgSector: UIImageView!
    @IBOutlet weak var sectorNameLabel: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
