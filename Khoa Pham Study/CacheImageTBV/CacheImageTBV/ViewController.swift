
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    
    var mang:[Number] = []
    var mangCache:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        
        //load JSON
        let u = URL(string: "http://khoapham.vn/KhoaPhamTraining/json/numbers.php")
        let req = URLRequest(url: u!)
        
        URLSession.shared.dataTask(with: req) { (data, res, err) in
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [AnyObject]
                for item in json{
                    self.mang.append(Number(
                        ten: item["NAME"] as! String,
                        hinh: item["URL"] as! String
                    ))
                    self.mangCache.append(UIImage(named: "default.jpg")!)
                }
                
                for (index, _) in self.mangCache.enumerated() {
                    let queue = DispatchQueue(label: "loadHinh")
                    queue.async {
                        let u = URL(string: self.mang[index].HINH )
                        do{
                            let d = try Data(contentsOf: u!)
                            self.mangCache[index] = UIImage(data: d)!
                            
                            DispatchQueue.main.async {
                                self.myTable.reloadData()
                            }
                            
                        }catch{  }
                    }
                }
                
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
                
            }catch{}
            
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! DONGTableViewCell
        
        cell.lblSo.text = mang[indexPath.row].TEN
        
        // tao luong phu de load hinh
        cell.imgHinh.image = mangCache[indexPath.row]
        
        return cell
        
    }

}

