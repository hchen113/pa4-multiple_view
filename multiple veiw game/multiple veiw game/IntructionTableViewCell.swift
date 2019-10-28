//
//  IntructionTableViewCell.swift
//  multiple veiw game
//
//  Created by Henry Chen on 10/27/19.
//  Copyright © 2019 Henry Chen. All rights reserved.
//

import UIKit

class IntructionTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var element_image: UIImageView!
    
    @IBOutlet weak var element_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
