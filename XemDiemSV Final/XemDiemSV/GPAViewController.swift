import UIKit

class GPAViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrPoint:[Point] = []
    var arrGPA:[GPA] = []
    var currGPA: GPA!
    var getHK = ConvertHK()
    @objc var arrHK: [String] = []
    @objc var id: String!
    @objc var root: Bool = false
    @objc let uDefault = UserDefaults.standard
    @IBOutlet weak var lblNotice: UILabel!
    
    @IBOutlet weak var lblUNT: UILabel!
    @IBOutlet weak var tbvGPA: UITableView!
    @IBOutlet weak var lblGPA: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        tbvGPA.dataSource = self
        tbvGPA.delegate = self
        if isInternetAvailable() {
           LoadJSON()
        }else{
            let bol = uDefault.bool(forKey: "DiemBefore")
            if bol == true {
                LoadLocalData()
                print("Load du lieu local")
                self.lblNotice.text = "Hiện tại"
                self.lblNotice.textColor = UIColor    .black
            } else {
                print("Kiem tra lai ket noi mang")
                self.lblNotice.text = "Không có kết nối mạng!"
                self.lblNotice.textColor = UIColor.red
            }
        }
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        BackToMenu()
//        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Back(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
        BackToMenu()
    }
    
    @objc func BackToMenu() {
        if root == true {
            self.root = false
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let menu = storyboard.instantiateViewController(withIdentifier: "menu") as! MenuViewController
            menu.id = self.id
            self.navigationController?.pushViewController(menu, animated: true)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHK.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gpa") as! GPATableViewCell
        print("---------------------------------")
        let mahk = "  " + self.getHK.getFront(hk: self.arrGPA[indexPath.row].MaHK) + self.getHK.getBack(hk: self.arrGPA[indexPath.row].MaHK)
        cell.lblHK.text = mahk
        cell.lblUNT.text = self.arrGPA[indexPath.row].UNT()
        cell.lblGPA.text = self.arrGPA[indexPath.row].GPA()
        cell.lblGPA.layer.cornerRadius = cell.lblGPA.layer.frame.height/2
        cell.lblGPA.layer.masksToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mahk = "  " + self.getHK.getFront(hk: self.arrGPA[indexPath.row].MaHK) + self.getHK.getBack(hk: self.arrGPA[indexPath.row].MaHK)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail = storyboard.instantiateViewController(withIdentifier: "detailgpa") as! DetailGPAViewController
        detail.id = self.id
        detail.arrPoint = self.arrGPA[indexPath.row].arrPoint
        detail.idHK = mahk
        self.navigationController?.pushViewController(detail, animated: true)
    }
    @objc func LoadJSON() {
        //load JSON
        let link = "http://xettuyen.hoasen.edu.vn/test/api/grade/" + id
        let u = URL(string: link)
        let req = URLRequest(url: u!)
        URLSession.shared.dataTask(with: req) { (data, res, error) in
            do{
                self.uDefault.set(data, forKey: "DiemDefault")
                self.uDefault.set(true, forKey: "DiemBefore")
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [AnyObject]
                for item in json{
                    self.arrPoint.append(Point(mahk: item["STRM"] as! String, subject: item["SUBJECT"] as! String, catalog: item["CATALOG_NBR"] as! String, classsection: item["CLASS_SECTION"] as! String, unttaken: item["UNT_TAKEN"] as! String, descr: item["DESCR"] as! String, gradedetail: item["GRADE_DETAIL"] as! String, grade: item["GRADE"] as! String))
                }
                self.convertGPA()
                DispatchQueue.main.async {
                    self.tbvGPA.reloadData()
                    self.loadcurrGPA()
                }
            }catch{
            }
            }.resume()
    }
    
    @objc func LoadLocalData() {
        do{
            let tmp = self.uDefault.data(forKey: "DiemDefault")!
            self.uDefault.set(tmp, forKey: "DiemDefault")
            self.uDefault.set(true, forKey: "DiemBefore")
            let json = try JSONSerialization.jsonObject(with: tmp, options:.allowFragments) as! [AnyObject]
            for item in json{
                self.arrPoint.append(Point(mahk: item["STRM"] as! String, subject: item["SUBJECT"] as! String, catalog: item["CATALOG_NBR"] as! String, classsection: item["CLASS_SECTION"] as! String, unttaken: item["UNT_TAKEN"] as! String, descr: item["DESCR"] as! String, gradedetail: item["GRADE_DETAIL"] as! String, grade: item["GRADE"] as! String))
            }
            self.convertGPA()
            DispatchQueue.main.async {
                self.tbvGPA.reloadData()
                self.loadcurrGPA()
            }
        }catch{
        }
    }
    
    @objc func loadcurrGPA() {
        self.currGPA = GPA(arrpoint: self.arrPoint)
        lblUNT.text = "Tính chỉ: " + currGPA.UNT()
        lblGPA.text = "GPA: " + currGPA.GPA()
    }
    @objc func convertGPA() {
        
        let tmpPoint = self.arrPoint
        for item in tmpPoint {
            if !self.arrHK.contains(item.MaHK) {
                self.arrHK.append(item.MaHK)
            }
        }
        var count = 0
        for hk in arrHK {
            print("--------")
            print(hk)
            var arrpoint:[Point] = []
            for item in tmpPoint {
                if item.MaHK == hk {
                    arrpoint.append(item)
                }
            }
            self.arrGPA.append(GPA(arrpoint: arrpoint))
            print(self.arrGPA[count].GPA())
            count = count + 1
        }
    }
}
