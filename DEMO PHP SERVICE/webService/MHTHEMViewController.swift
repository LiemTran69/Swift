//
//  MHTHEMViewController.swift
//  webService
//
//  Created by PhamTruongDangKhoa on 5/29/17.
//  Copyright © 2017 PhamTruongDangKhoa. All rights reserved.
//

import UIKit

class MHTHEMViewController: UIViewController {
    
    @IBOutlet weak var txtHoTen: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblInfo: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        }

    @IBAction func btnThem(_ sender: UIButton) {
        // req
        let u:URL = URL(string: "http://localhost/WebService1503/USERS_ADD.php")!
        var req = URLRequest(url: u)
        req.httpMethod = "POST"
        
        let hoten = txtHoTen.text!
        let email = txtEmail.text!
        let body = "UN=\(hoten)&EM=\(email)"
        let bodyData = body.data(using: .utf8)
        req.httpBody = bodyData
        
        // session
        let session = URLSession.shared.dataTask(with: req) { (myData:Data?, myReq:URLResponse?, myErr:Error?) in
            print(myData!)
            print(String(data: myData!, encoding: .utf8)!)
            do {
                let json = try JSONSerialization.jsonObject(with: myData!, options: .allowFragments) as! Dictionary<String, AnyObject>
                
                let kq = json["kq"] as! String
                if kq == "0" {
                    DispatchQueue.main.async(execute: { 
                        self.lblInfo.text = "khong them duoc"
                    })
                    
                } else {
                    DispatchQueue.main.async(execute: { 
                        self.navigationController?.popViewController(animated: true)
                    })
                    
                }
            } catch {}
            
        }
        session.resume()
        
        //     data=>json->kq
        
    }
    

}
