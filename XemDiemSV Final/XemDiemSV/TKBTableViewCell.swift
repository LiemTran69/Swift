//
//  TKBTableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 9/15/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class TKBTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var roomBack: UIView!
    @IBOutlet weak var lblRoom: UILabel!
    @IBOutlet weak var imvClock: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
