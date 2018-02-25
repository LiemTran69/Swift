import UIKit

class DiemDanhViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @objc var id: String!
    var ArrCount: [Attendance] = []
    @objc var idHK: String!
    @objc var Semester: String!
    @IBOutlet weak var tbvAttendance: UITableView!    
    @IBOutlet weak var lblNotice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = true // or false to disable rotation

        tbvAttendance.delegate = self
        tbvAttendance.dataSource = self
        if isInternetAvailable() {
            lblNotice.isHidden = true
            LoadJSON(smt: self.idHK)
        }else{
            lblNotice.isHidden = false
            lblNotice.textColor = UIColor.red
            lblNotice.text = "Không có kết nối mạng!"
        }

        // Do any additional setup after loading the view.
    }
    
    //TableView 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrCount.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attend") as! AttendTableViewCell
        cell.lblClassNBR.text = ArrCount[indexPath.row].Subject
        cell.lblNameClass.text = ArrCount[indexPath.row].Descr
        cell.lblNOABS.text = String(ArrCount[indexPath.row].NOABS)
        cell.backView.layer.cornerRadius = 15
        cell.backView.layer.masksToBounds = true
        return cell
    }
    
    @objc func LoadJSON(smt: String) {
        
        //load JSON
        let link = "http://xettuyen.hoasen.edu.vn/test/api/attendance/" + id + "$" + smt
        print(link)
        let u = URL(string: link)
        let req = URLRequest(url: u!)
        URLSession.shared.dataTask(with: req) { (data, res, error) in
            do{
                self.ArrCount.removeAll()
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [AnyObject]
                for item in json{
                    self.ArrCount.append(Attendance(strm: item["STRM"] as! String, class_n: item["CLASS_NBR"] as! String, subject: item["SUBJECT"] as! String, descr: item["DESCR"] as! String, no: item["NOABS"] as! Int))
                }
                //                self.uDefault.set(self.arrayPoint, forKey: "ArrDiemDefault")
                DispatchQueue.main.async {
                self.tbvAttendance.reloadData()
                }
                
            }catch{
                //                self.arrayPoint = self.uDefault.array(forKey: "ArrDiemDefault") as! [DiemThanhPhan]
//                self.tbvDiemTP.reloadData()
            }
            }.resume()
    
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeLeft]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
