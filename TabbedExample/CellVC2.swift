//
//  CellVC2.swift
//  TabbedExample
//
//  Created by Developer on 9/10/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit

class CellVC2: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
