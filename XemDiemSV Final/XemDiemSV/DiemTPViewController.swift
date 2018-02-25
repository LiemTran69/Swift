import UIKit
import SystemConfiguration

class DiemTPViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    var arrayPoint:[Point] = []
    var filteredPoint:[Point] = []
    
    @objc var id: String!
    @objc var root: Bool = false
    @objc let uDefault = UserDefaults.standard
    @IBOutlet weak var tbvDiemTP: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblNotice: UILabel!
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        tbvDiemTP.dataSource = self
        tbvDiemTP.allowsSelection = false
        searchBar.delegate = self
        if isInternetAvailable() {
            lblNotice.isHidden = true
            LoadJSON()
        } else {
            let bol = uDefault.bool(forKey: "DiemBefore")
            if bol == true {
                LoadLocalData()
                print("Load du lieu local")
            } else {
                print("Kiem tra lai ket noi mang")
                lblNotice.isHidden = false
                lblNotice.textColor = UIColor.red
                lblNotice.text = "Không có kết nối mạng!"
            }
        }
        
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchActive == false){
            return arrayPoint.count
        }else{
            return filteredPoint.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "diemtp") as! DiemTPTableViewCell
        if searchActive == false {
            cell.lblHocKy.text = self.arrayPoint[indexPath.row].MaHK
            cell.lblMonHoc.text = self.arrayPoint[indexPath.row].Descr
            cell.lblDiemQT.text = self.arrayPoint[indexPath.row].Grade_Detail
            cell.lblDiemTB.text = self.arrayPoint[indexPath.row].Grade
        } else {
            cell.lblHocKy.text = self.filteredPoint[indexPath.row].MaHK
            cell.lblMonHoc.text = self.filteredPoint[indexPath.row].Descr
            cell.lblDiemQT.text = self.filteredPoint[indexPath.row].Grade_Detail
            cell.lblDiemTB.text = self.filteredPoint[indexPath.row].Grade
        }
        cell.imvIcon.image = UIImage(named: "12959.png")
        cell.viewDiem.layer.cornerRadius = 10
        cell.viewDiem.layer.masksToBounds = true
        return cell
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredPoint = arrayPoint.filter { $0.Descr.lowercased().contains((searchText.lowercased())) }
        for item in filteredPoint {
            print(item.Descr)
        }
        if(filteredPoint.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tbvDiemTP.reloadData()
    }
    
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TroVe(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func BackToMenu() {
        if root {
            self.root = false
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let menu = storyboard.instantiateViewController(withIdentifier: "menu") as! MenuViewController
            menu.id = self.id
            self.navigationController?.pushViewController(menu, animated: true)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func LoadJSON() {
        
        //load JSON
        let link = "http://xettuyen.hoasen.edu.vn/test/api/grade/"+id
        print(link)
        let u = URL(string: link)
        let req = URLRequest(url: u!)
        URLSession.shared.dataTask(with: req) { (data, res, error) in
            do{
                print("???????????????????????????????????????????????????")
                self.uDefault.set(data, forKey: "DiemDefault")
                self.uDefault.set(true, forKey: "DiemBefore")
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [AnyObject]
                for item in json{
                    self.arrayPoint.append(Point(mahk: item["STRM"] as! String, subject: item["SUBJECT"] as! String, catalog: item["CATALOG_NBR"] as! String, classsection: item["CLASS_SECTION"] as! String, unttaken: item["UNT_TAKEN"] as! String, descr: item["DESCR"] as! String, gradedetail: item["GRADE_DETAIL"] as! String, grade: item["GRADE"] as! String))
                }
                DispatchQueue.main.async {
                    self.tbvDiemTP.reloadData()
                }
            }catch{
            }
            }.resume()
    }
    @objc func LoadLocalData() {
        do{
            let tmp = self.uDefault.data(forKey: "DiemDefault")!
            let json = try JSONSerialization.jsonObject(with: tmp, options:.allowFragments) as! [AnyObject]
            for item in json{
                self.arrayPoint.append(Point(mahk: item["STRM"] as! String, subject: item["SUBJECT"] as! String, catalog: item["CATALOG_NBR"] as! String, classsection: item["CLASS_SECTION"] as! String, unttaken: item["UNT_TAKEN"] as! String, descr: item["DESCR"] as! String, gradedetail: item["GRADE_DETAIL"] as! String, grade: item["GRADE"] as! String))
            }
            //                self.uDefault.set(self.arrayPoint, forKey: "DiemDefault")
            DispatchQueue.main.async {
                self.tbvDiemTP.reloadData()
            }
        }catch{
            print("Kiem Tra Lai Duong Truyen")
        }
    }
}
