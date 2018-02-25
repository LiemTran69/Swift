import UIKit

class SelectSMViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @objc var arrHK: [String] = []
    @objc var id: String!
    var getHK = ConvertHK()
    var arrayPoint:[Point] = []
    @objc let uDefault = UserDefaults.standard
    
    @IBOutlet weak var lblNotice: UILabel!
    @IBOutlet weak var tbvAttendSM: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvAttendSM.dataSource = self
        tbvAttendSM.delegate = self
        if isInternetAvailable(){
            lblNotice.isHidden = true
            LoadJSON()
        } else {
            lblNotice.isHidden = false
            lblNotice.textColor = UIColor.red
            lblNotice.text = "Không có kết nối mạng!"
        }
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHK.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendsm") as! AttendSMTableViewCell
        cell.lblSM.text = getHK.getNameHK(hk: arrHK[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let attend = storyboard.instantiateViewController(withIdentifier: "diemdanh") as! DiemDanhViewController
        attend.id = self.id
        attend.idHK = arrHK[indexPath.row]
        self.navigationController?.pushViewController(attend, animated: true)
        print("select")
    }
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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
                    self.arrHK.append(item["STRM"] as! String)
                }
                self.arrHK = self.removeDuplicates(array: self.arrHK)
                print(self.getLastSM())
                self.arrHK.append(self.getLastSM())
                DispatchQueue.main.async {
                    self.tbvAttendSM.reloadData()
                }
            }catch{
            }
            }.resume()
    }
    func getLastSM() -> String
    {
        var final = ""
        let last = self.arrHK.last!
        let lastEnd = last.suffix(2)
        print(lastEnd)
        if lastEnd == "34"{
            final = String(Int(last)! + 97)
        }
        else{
            final = String(Int(last)! + 1)
        }
        return final
    }
    @objc func LoadLocalData() {
        do{
            let tmp = self.uDefault.data(forKey: "DiemDefault")!
            let json = try JSONSerialization.jsonObject(with: tmp, options:.allowFragments) as! [AnyObject]
            for item in json{
                self.arrHK.append(item["STRM"] as! String)
            }
            self.arrHK = self.removeDuplicates(array: self.arrHK)
            self.tbvAttendSM.reloadData()
        }catch{
            print("Kiem Tra Lai Duong Truyen")
        }
    }
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
}
