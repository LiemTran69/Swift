import UIKit

class DetailGPAViewController: UIViewController, UITableViewDataSource {

    @objc var id: String!
    var arrPoint:[Point] = []
    @objc var idHK: String!
    
    @IBOutlet weak var lblHK: UILabel!
    
    @IBOutlet weak var tbvDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        tbvDetail.dataSource = self
        lblHK.text = idHK
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPoint.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailgpa") as! DetailGPATableViewCell
        cell.lblName.text = arrPoint[indexPath.row].Descr
        cell.lblUNT.text = arrPoint[indexPath.row].Unt_Taken
        cell.lblGPA.text = arrPoint[indexPath.row].getGPA()
        cell.lblCharPoint.text = arrPoint[indexPath.row].getCharPoint()
        return cell
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goHome(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let menu1 = storyboard.instantiateViewController(withIdentifier: "menu") as! MenuViewController
//        menu1.id = self.id
//        self.navigationController?.pushViewController(menu1, animated: true)
    }
}
