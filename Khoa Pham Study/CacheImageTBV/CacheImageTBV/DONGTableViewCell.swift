//
//  DONGTableViewCell.swift
//  CacheImageTBV
//
//  Created by PhamTruongDangKhoa on 5/26/17.
//  Copyright © 2017 PhamTruongDangKhoa. All rights reserved.
//

import UIKit

class DONGTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var lblSo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
