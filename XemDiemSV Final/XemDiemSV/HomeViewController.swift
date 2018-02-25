import UIKit
class HomeViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var lblMSSV: UILabel!
    @IBOutlet weak var lblTenSV: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var tbvInfomation: UITableView!
    @objc var arrIcon: [String] = []
    @objc var arrImageTopic: [String] = ["iconClass.jpg","iconMajor.jpg","iconCMND.jpg","iconNgaySinh.jpg","iconCall.jpg","iconAddress.jpg","iconGPA.jpg","iconTinChi.jpg"]
    @objc var arrTopic: [String] = ["Lớp", "Ngành học","Số CMND","Ngày sinh","Số điện thoại","Địa chỉ","GPA hiện tại","Số tín chỉ tích luỹ"]
    @objc var arrConten: [String] = ["PM141", "Kỹ thuật phần mềm", "302823023","20/05/1996","0907715773","TP.HCM","3.2","121"]
    @objc var chucnang = 0
    @objc var id: String!
    @objc let uDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        imgAvatar.layer.borderWidth = 2
        imgAvatar.layer.borderColor = UIColor.white.cgColor
        imgAvatar.layer.cornerRadius = imgAvatar.layer.frame.height/2
        imgAvatar.clipsToBounds = true
        imgAvatar.layer.masksToBounds = true
        
        tbvInfomation.dataSource = self
        tbvInfomation.allowsSelection = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
//TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTopic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infomation") as! InfomationTableViewCell
        cell.lblTopic.text = arrTopic[indexPath.row]
        cell.lblConten.text = arrConten[indexPath.row]
        cell.imvContents.image = UIImage(named: arrImageTopic[indexPath.row])
        cell.imvContents.layer.cornerRadius = 3
        cell.imvContents.layer.masksToBounds = true
        return cell
    }
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func LogOut(_ sender: Any) {
        self.uDefault.set(false, forKey: "launchedBefore")
        self.uDefault.set("", forKey: "idDefault")
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
