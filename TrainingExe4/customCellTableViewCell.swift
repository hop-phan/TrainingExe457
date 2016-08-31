//
//  customCellTableViewCell.swift
//  TrainingExe4
//
//  Created by HopPD on 8/26/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import UIKit

class customCellTableViewCell: UITableViewCell {
    
    //MARK:Properties
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var captureDate: UILabel!
    
    @IBOutlet weak var av: UILabel!

    @IBOutlet weak var lovi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
