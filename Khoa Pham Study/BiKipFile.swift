//
//  BiKipFile.swift
//  Baitap buoi7
//
//  Created by Liem Tran on 3/31/17.
//  Copyright © 2017 Liem Tran. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    func ghostButton()
    {
        
    }
    
    func ghostButton(borderWidth: CGFloat, borderColor:UIColor, cornerRadius:CGFloat)
    {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}

