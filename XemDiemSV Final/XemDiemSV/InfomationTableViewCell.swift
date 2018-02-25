//
//  InfomationTableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 9/17/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class InfomationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTopic: UILabel!
    @IBOutlet weak var lblConten: UILabel!
    @IBOutlet weak var imvContents: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
