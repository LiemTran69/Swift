//
//  cellinfo.swift
//  webService
//
//  Created by PhamTruongDangKhoa on 5/22/17.
//  Copyright © 2017 PhamTruongDangKhoa. All rights reserved.
//

import Foundation

class USER {
    var ID:String
    var HOTEN:String
    var EMAIL:String
    
    init(id:String, hoten:String, email:String){
        self.ID = id
        self.HOTEN = hoten
        self.EMAIL = email
    }
}
