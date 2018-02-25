import UIKit

class TKBViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var scheduleCollectionview: UICollectionView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var tbvTKB: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @objc let uDefault = UserDefaults.standard
    @IBOutlet weak var lblNotice: UILabel!
    
    var arrayTKB:[TKB] = [TKB]()
    var arrayCurrentTKB: [TKB] = [TKB]()
    @objc var id: String!
    @objc var preCell: ScheduleCollectionViewCell?
    @objc var selectedIndex: IndexPath = []
    @objc var tmpIndex: IndexPath = []
    @objc var thisDate = Date()
    @objc var thisDay: String!
    @objc var currentDay: String!
    @objc var currentMonth: String!
    @objc var currentYear: String!
    @objc var thisMonth: String!
    @objc var thisYear: String!
    let getWeek = DateTime()
    @objc var arrDay: [String] = []
    @objc var arrMonth: [String] = []
    @objc var arrYear: [String] = []
    @objc var arrWeekDay: [String] = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    @objc var firstLoad: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        LoadCurrentCalendar(thisdate: thisDate)
        thisDay = getWeek.getDate(date: thisDate)
        thisMonth = getWeek.getMonth(date: thisDate)
        thisYear = getWeek.getYear(date: thisDate)
        currentDay = thisDay
        currentMonth = thisMonth
        currentYear = thisYear
        print(currentDay)
        if isInternetAvailable() {
            LoadSchedule()
        }else{
            let bol = uDefault.bool(forKey: "TKBBefore")
            if bol == true {
                LoadLocalData()
                print("Load du lieu local")
                self.lblNotice.text = "Ca học"
                self.lblNotice.textColor = UIColor    .black
            } else {
                print("Kiem tra lai ket noi mang")
                self.lblNotice.text = "Không có kết nối mạng!"
                self.lblNotice.textColor = UIColor.red
            }
        }
        scheduleCollectionview.dataSource = self
        scheduleCollectionview.delegate = self
        tbvTKB.dataSource = self
        tbvTKB.allowsSelection = false
    }
    
    //làm sáng status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Load TKB tuần trước
    @IBAction func PreviousWeek(_ sender: Any) {
        let selectedWeek = self.getWeek.goToDayFrom(date: thisDate, number: -7)
        self.thisDate = selectedWeek
        LoadCurrentCalendar(thisdate: selectedWeek)
        self.arrayCurrentTKB.removeAll()
        LoadCurrentTKB(day: arrDay[selectedIndex.row], month: arrMonth[selectedIndex.row], year: arrYear[selectedIndex.row])
        scheduleCollectionview.reloadData()
        preCell?.bigBack.isHidden = true
        preCell?.lblDay.textColor = UIColor.black
        tbvTKB.reloadData()
        print(selectedIndex)
        print(preCell?.lblDay.text ?? String())
    }
    
    //Load TKB tuần sau
    @IBAction func NextWeek(_ sender: Any) {
        let selectedWeek = self.getWeek.goToDayFrom(date: thisDate, number: 7)
        self.thisDate = selectedWeek
        LoadCurrentCalendar(thisdate: selectedWeek)
        self.arrayCurrentTKB.removeAll()
        LoadCurrentTKB(day: arrDay[selectedIndex.row], month: arrMonth[selectedIndex.row], year: arrYear[selectedIndex.row])
        scheduleCollectionview.reloadData()
        preCell?.bigBack.isHidden = true
        preCell?.lblDay.textColor = UIColor.black
        tbvTKB.reloadData()
        print(selectedIndex)
        print(preCell?.lblDay.text ?? String())
        
    }
    
    @IBAction func SwipeBack(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //Load thứ hiện tại để gán vào selectedIndex ban đầu

    //Load lịch của tuần hiện tại
    @objc func LoadCurrentCalendar(thisdate: Date){
        arrDay = getWeek.getWeekDay(date: thisdate)
        arrMonth = getWeek.getWeekMonth(date: thisdate)
        arrYear = getWeek.getWeekYear(date: thisdate)
        lblDate.text = arrDay[0] + "/" + arrMonth[0] + "/" + arrYear[0] + " - " + arrDay[6] + "/" + arrMonth[6] + "/" + arrYear[6]
    
    }
    //Load TKB của ngày được chọn
    @objc func LoadCurrentTKB(day: String, month: String, year: String){
        print("Call")
        for (index, _) in self.arrayTKB.enumerated()  {
            if (arrayTKB[index].DayOfMonth == Int(day) && arrayTKB[index].Month == Int(month) && arrayTKB[index].Year == Int(year)){
                self.arrayCurrentTKB.append(arrayTKB[index])
                print("success------curent")
                print(day)
                print(month)
                print(year)
                print(arrayTKB[index].Name)
                print(arrayTKB[index].StartTime)
            }
            else{
            }
            
        }
        arrayCurrentTKB = removeDuplicates(array: arrayCurrentTKB)
        arrayCurrentTKB = arrayCurrentTKB.sorted(by: { $0.Time < $1.Time })

    }
    //Check Arr có buổi học trong tuần
    @objc func checkBusyArr(day: String, month: String, year: String) -> Bool{
        var checkBusy = false
        for (index, _) in self.arrayTKB.enumerated()  {
            if (arrayTKB[index].DayOfMonth == Int(day) && arrayTKB[index].Month == Int(month) && arrayTKB[index].Year == Int(year)){
                checkBusy = true
            }
            else{
                checkBusy = false
            }
        }
        return checkBusy
    }
   
    //Load toàn bộ tkb hiện có của SV
    @objc func LoadSchedule() {
        //load JSON
        let link = "http://xettuyen.hoasen.edu.vn/test/api/schedulev2/"+id
        print(link)
        let u = URL(string: link)
        let req = URLRequest(url: u!)
        URLSession.shared.dataTask(with: req) { (data, res, error) in
            do{
                print("???????????????????????????????????????????????????")
                self.uDefault.set(data, forKey: "TKBDefault")
                self.uDefault.set(true, forKey: "TKBBefore")
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [AnyObject]
                for item in json{
                    self.arrayTKB.append(TKB(name: item["name"] as! String, day: item["dayOfMonth"] as! Int, start: item["startTime"] as! String, end: item["endTime"] as! String, color: item["color"] as! String, month: item["month"] as! Int, year: item["year"] as! Int))
//                    print("Success")
                    print(self.arrayTKB[0].Name)
                }
                self.LoadCurrentTKB(day: self.thisDay, month: self.thisMonth, year: self.thisYear)
                DispatchQueue.main.async {
                    self.tbvTKB.reloadData()
                }
            }catch{}
            }.resume()
    }
    
    @objc func LoadLocalData() {
        do{
            let tmp = self.uDefault.data(forKey: "TKBDefault")!
            self.uDefault.set(tmp, forKey: "TKBDefault")
            let json = try JSONSerialization.jsonObject(with: tmp, options:.allowFragments) as! [AnyObject]
            for item in json{
                self.arrayTKB.append(TKB(name: item["name"] as! String, day: item["dayOfMonth"] as! Int, start: item["startTime"] as! String, end: item["endTime"] as! String, color: item["color"] as! String, month: item["month"] as! Int, year: item["year"] as! Int))
                //                    print("Success")
            }
            self.LoadCurrentTKB(day: self.thisDay, month: self.thisMonth, year: self.thisYear)
            DispatchQueue.main.async {
                self.tbvTKB.reloadData()
            }
        }catch{}
    }
    
    //Collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "schedule", for: indexPath as IndexPath) as! ScheduleCollectionViewCell
        cell.lblDay.text = arrDay[indexPath.row]
        cell.lblDay.textColor = UIColor.black
        cell.lblWeekDay.text = arrWeekDay[indexPath.row]
        cell.bigBack.isHidden = true
        //Hiện icon đánh dấu ngày hôm nay
        if indexPath == selectedIndex {
                preCell = cell
                cell.bigBack.isHidden = false
                cell.lblDay.textColor = UIColor.white
        }
        
        //Set cell mặc định khi load TKB lần đầu và khi quay lại tuần hiện tại 
        if (cell.lblDay.text == currentDay && arrMonth[indexPath.row] == currentMonth && arrYear[indexPath.row] == currentYear) {
            cell.smallBack.isHidden = false
            if firstLoad == true {
            cell.bigBack.isHidden = false
            cell.lblDay.textColor = UIColor.white
//             self.arrayCurrentTKB.removeAll()
//             self.LoadCurrentTKB(day: self.arrDay[indexPath.row], month: self.arrMonth[indexPath.row], year: self.arrYear[indexPath.row])
//             self.tbvTKB.reloadData()
            self.firstLoad = false
            preCell = cell
            selectedIndex = indexPath
            }
        }
        else{
            cell.smallBack.isHidden = true
        }
        let check = self.checkBusyArr(day: self.arrDay[indexPath.row], month: self.arrMonth[indexPath.row], year: self.arrYear[indexPath.row])
        if (check == true) {
            print("Co Lich")
            cell.smallBack.isHidden = false
        }
        cell.sizeThatFits(CGSize(width: self.scheduleCollectionview.frame.width/7.5, height: 90))
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = collectionView.cellForItem(at: indexPath) as! ScheduleCollectionViewCell
        print("You selected")
        selectedIndex = indexPath
        selectedItem.lblDay.textColor = UIColor.white
        selectedItem.bigBack.isHidden = false
        self.arrayCurrentTKB.removeAll()
        self.LoadCurrentTKB(day: self.arrDay[indexPath.row], month: self.arrMonth[indexPath.row], year: self.arrYear[indexPath.row])
        self.tbvTKB.reloadData()
        
        if preCell?.isSelected == false {
            preCell?.bigBack.isHidden = true
            preCell?.lblDay.textColor = UIColor.black
        }
        preCell = selectedItem
        print("DA CHON" + String(describing: indexPath))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let didselectedItem = collectionView.cellForItem(at: indexPath) as! ScheduleCollectionViewCell
        didselectedItem.bigBack.isHidden = true
        didselectedItem.lblDay.textColor = UIColor.black
        print("DÊSELEC")
        
        
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCurrentTKB.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tkb") as! TKBTableViewCell
        cell.lblName.text = slipName(name: arrayCurrentTKB[indexPath.row].Name)
        cell.lblEndTime.text = arrayCurrentTKB[indexPath.row].EndTime
        cell.lblStartTime.text = arrayCurrentTKB[indexPath.row].StartTime
        cell.lblRoom.text = slipCampus(name: arrayCurrentTKB[indexPath.row].Name)
        cell.imvClock.image = UIImage(named: "clock 2.png")
        cell.roomBack.layer.cornerRadius = 15
        cell.roomBack.layer.masksToBounds = true
        return cell
    }
    
    func removeDuplicates(array: [TKB]) -> [TKB] {
        var encountered = Set<Int>()
        var result: [TKB] = []
        for value in array {
            if encountered.contains(value.Time) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value.Time)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
    
    @objc func slipCampus(name: String) -> String {
        var tmp = name
        for letter in name.characters{
            if String(letter) != "-"{
                tmp = tmp.replacingOccurrences(of: String(letter), with: "")
            }
            else{
                tmp = tmp.replacingOccurrences(of: String(letter), with: "")
                return tmp
            }
        }
        print(tmp)
        return tmp
    }
    @objc func slipName(name: String) -> String {
        var tmp = ""
        for letter in name.characters{
            if String(letter) != "-"{
                tmp = tmp + String(letter)
            }
            else{
                return tmp
            }
        }
        print(tmp)
        return tmp
    }

}
