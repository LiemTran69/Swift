//
//  AttendTableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 9/21/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class AttendTableViewCell: UITableViewCell {

    @IBOutlet weak var lblClassNBR: UILabel!
    @IBOutlet weak var lblNameClass: UILabel!
    @IBOutlet weak var lblNOABS: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
