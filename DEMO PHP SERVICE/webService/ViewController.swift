//
//  ViewController.swift
//  webService
//
//  Created by PhamTruongDangKhoa on 5/22/17.
//  Copyright © 2017 PhamTruongDangKhoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var arrUser:[USER] = []
    
    @IBOutlet weak var tbView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" View Did Load")
        tbView.dataSource = self
        tbView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Will Appear")
        loadUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DID Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did Disappear")
    }
    
    func loadUsers(){
        let u:URL = URL(string: "http://localhost/WebService1503/USERS_LIST.php")!
        
        var req = URLRequest(url: u)
        req.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: req) { (myData, myRes, myErr) in
            if myData != nil, myErr == nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: myData!, options: .allowFragments) as! [AnyObject]
                    self.arrUser = []
                    for obj in json {
                        self.arrUser.append(USER(
                            id: obj["ID"] as! String,
                            hoten: obj["HOTEN"] as! String,
                            email: obj["EMAIL"] as! String))
                    }
                    
                    DispatchQueue.main.async(execute: {
                        self.tbView.reloadData()
                    })
                    
                } catch {
                    print("error")
                }
                
                
            }
        }
        session.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblHoTen.text = arrUser[indexPath.row].HOTEN
        cell.lblEmail.text = arrUser[indexPath.row].EMAIL
        return cell
    }
    
    @IBAction func btnThem(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mhThem = sb.instantiateViewController(withIdentifier: "THEM") as! MHTHEMViewController
        self.navigationController?.pushViewController(mhThem, animated: true)
        
    }
    
    // tao button sua
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt index: IndexPath) -> [UITableViewRowAction]? {
        
        let sua = UITableViewRowAction(style: .default, title: "Sửa") { (action:UITableViewRowAction, index:IndexPath) in
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mhSua = sb.instantiateViewController(withIdentifier: "SUA") as! MHSUAViewController
            mhSua.idSua = Int(self.arrUser[index.row].ID)
            self.navigationController?.pushViewController(mhSua, animated: true)
            
        }
        
        return [sua]
        
    }
    
}

