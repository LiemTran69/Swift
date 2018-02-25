//
//  GPATableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 10/12/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class GPATableViewCell: UITableViewCell {

    @IBOutlet weak var lblHK: UILabel!
    @IBOutlet weak var lblUNT: UILabel!
    @IBOutlet weak var lblGPA: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
