//
//  DetailGPATableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 10/16/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class DetailGPATableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUNT: UILabel!
    @IBOutlet weak var lblCharPoint: UILabel!
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
