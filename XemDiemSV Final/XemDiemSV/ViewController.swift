import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblNotice: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var loginView: UIView!
    @objc var dataDefault: Data!
    @objc let uDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        btnLogin.layer.borderWidth = 2
        btnLogin.layer.borderColor = UIColor.white.cgColor
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.masksToBounds = true
        loginView.layer.cornerRadius = 20
        loginView.layer.masksToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            // Do not thing if this is not first
            print(uDefault.string(forKey: "idDefault")!)
            print("This is not first launch.")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let menu = storyboard.instantiateViewController(withIdentifier: "menu") as! MenuViewController
            menu.id = uDefault.string(forKey: "idDefault")!
            self.navigationController?.pushViewController(menu, animated: false)
        }else{
            print("This is first launch")
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        txtPassword.text = ""
        txtUsername.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Login(_ sender: Any) {
        if isInternetAvailable() {
            ChungThuc(username: txtUsername.text!, password: txtPassword.text!)
        }else{
            self.lblNotice.isHidden = false
            self.lblNotice.text = "Không có kết nối mạng!"
        }
        
    }
    //Ham dang nhap vao he thong
    @objc func ChungThuc(username: String, password:String) {
        //load JSON
        let link = "http://xettuyen.hoasen.edu.vn/test/api/authenticate/"+username+"$$$$$$"+password
        print(link)
        let u = URL(string: link)
        let req = URLRequest(url: u!)
        URLSession.shared.dataTask(with: req) { (data, res, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! String
                print(json)
                self.dataDefault = data
                if json == "true" {
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let menu = storyboard.instantiateViewController(withIdentifier: "menu") as! MenuViewController
                        menu.id = self.slipUsername(username: username)
                        self.settingUserDefaul(id: menu.id)
                        self.navigationController?.pushViewController(menu, animated: true)
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.lblNotice.isHidden = false
                        self.lblNotice.text = "Kiểm tra lại tài khoản & mật khẩu!"
                    }
                    print("Sai Mat Khau")
                }
            }catch{}
            }.resume()
    }
    @objc func slipUsername(username: String) -> String {
        var tmp = ""
        for letter in username.characters{
            if String(letter) != "."{
                tmp = tmp + String(letter).uppercased()
            }
            else{
                tmp = tmp + "-"
            }
        }
        print(tmp)
        return tmp
    }
    @objc func settingUserDefaul(id: String){

        print("This is First launch, setting UserDefault.")
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        UserDefaults.standard.set(self.dataDefault, forKey: "TKBDefault")
        UserDefaults.standard.set(self.dataDefault, forKey: "DiemDefault")
        UserDefaults.standard.set(false, forKey: "TKBBefore")
        UserDefaults.standard.set(false, forKey: "DiemBefore")
        UserDefaults.standard.set(id, forKey: "idDefault")
        UserDefaults.standard.synchronize()
    }
}

