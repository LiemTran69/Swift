//
//  DiemTPTableViewCell.swift
//  XemDiemSV
//
//  Created by Liem Tran on 9/13/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import UIKit

class DiemTPTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMonHoc: UILabel!
    @IBOutlet weak var lblHocKy: UILabel!
    @IBOutlet weak var lblDiemQT: UILabel!
    @IBOutlet weak var lblDiemTB: UILabel!
    @IBOutlet weak var viewDiem: UIView!
    @IBOutlet weak var imvIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
