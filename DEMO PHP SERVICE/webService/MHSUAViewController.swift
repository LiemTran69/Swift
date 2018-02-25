//
//  MHSUAViewController.swift
//  webService
//
//  Created by PhamTruongDangKhoa on 5/31/17.
//  Copyright © 2017 PhamTruongDangKhoa. All rights reserved.
//

import UIKit

class MHSUAViewController: UIViewController {

    
    @IBOutlet weak var txtHoTen: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var idSua:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserDetail()
        
    }
    
    func getUserDetail(){
        
        let u = URL(string: "http://localhost/WebService1503/USERS_DETAIL.php")
        var req = URLRequest(url: u!)
        
        req.httpMethod = "POST"
        
        let s = "id=" + String(idSua)
        let d = s.data(using: .utf8)
        req.httpBody = d
        
        URLSession.shared.dataTask(with: req) { (d, r, e) in
            do{
                let json = try JSONSerialization.jsonObject(with: d!, options: .allowFragments) as AnyObject
                DispatchQueue.main.async {
                    self.txtHoTen.text = json["HOTEN"] as! String
                    self.txtEmail.text = json["EMAIL"] as! String
                }
            }catch{
            
            }
        }.resume()
    }

    @IBAction func SUA(_ sender: Any) {
        Sua_User()
    }
    
    func Sua_User(){
        
        let u = URL(string: "http://localhost/WebService1503/USERS_UPDATE.php")
        var req = URLRequest(url: u!)
        
        req.httpMethod = "POST"
        
        let id = String(idSua)
        let txtHOTEN = txtHoTen.text
        let txtEMAIL = txtEmail.text
        let s = "ID=" + id + "&HOTEN=" + txtHOTEN! + "&EMAIL=" + txtEMAIL!
        let d = s.data(using: .utf8)
        req.httpBody = d
        
        URLSession.shared.dataTask(with: req) { (d, r, e) in
            do{
                let json = try JSONSerialization.jsonObject(with: d!, options: .allowFragments) as AnyObject
                DispatchQueue.main.async {
                    let kq = json["kq"] as! String
                    if kq=="1" {
                        self.navigationController?.popToRootViewController(animated: true)
                    }else{
                        print("LOI UPDATE")
                    }
                }
            }catch{
                
            }
            }.resume()
    }

    @IBAction func XOA(_ sender: Any) {
    }
    

}
