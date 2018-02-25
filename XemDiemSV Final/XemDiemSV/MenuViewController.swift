import UIKit
import LocalAuthentication

class MenuViewController: UIViewController {

    @IBOutlet weak var viewTitle: UIView!

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    
    @objc var id: String!
    @objc let uDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = id
        EditBtn(btn: btn1)
        EditBtn(btn: btn2)
        EditBtn(btn: btn3)
        EditBtn(btn: btn4)
        EditBtn(btn: btn5)
        EditBtn(btn: btn6)
        viewTitle.layer.cornerRadius = 10
        viewTitle.layer.masksToBounds = true
    }
    @objc func EditBtn ( btn: UIButton) {
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
    }
    @IBAction func LoadFunc(_ sender: UIButton) {
        
        if sender.tag == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let home = storyboard.instantiateViewController(withIdentifier: "home") as! HomeViewController
            home.id = self.id
            self.navigationController?.pushViewController(home, animated: true)
        }
        if sender.tag == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sm = storyboard.instantiateViewController(withIdentifier: "selectsm") as! SelectSMViewController
            sm.id = self.id
            self.navigationController?.pushViewController(sm, animated: true)
        }
        if sender.tag == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tkb = storyboard.instantiateViewController(withIdentifier: "tkb") as! TKBViewController
            tkb.id = self.id
            self.navigationController?.pushViewController(tkb, animated: true)
        }
        if sender.tag == 3 {
            
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let diemtp = storyboard.instantiateViewController(withIdentifier: "diemtp") as! DiemTPViewController
            //diemtp.id = self.id
            //self.navigationController?.pushViewController(diemtp, animated: true)
            
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [unowned self] success, authenticationError in

                    DispatchQueue.main.async {
                        if success {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let diemtp = storyboard.instantiateViewController(withIdentifier: "diemtp") as! DiemTPViewController
                            diemtp.id = self.id
                            self.navigationController?.pushViewController(diemtp, animated: true)
                        } else {
                            let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(ac, animated: true)
                        }
                    }
                }
            } else {
                let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }
        if sender.tag == 4 {
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let gpa = storyboard.instantiateViewController(withIdentifier: "gpa") as! GPAViewController
            //gpa.id = self.id
            //self.navigationController?.pushViewController(gpa, animated: true)

            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [unowned self] success, authenticationError in

                    DispatchQueue.main.async {
                        if success {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let gpa = storyboard.instantiateViewController(withIdentifier: "gpa") as! GPAViewController
                            gpa.id = self.id
                            self.navigationController?.pushViewController(gpa, animated: true)
                        } else {
                            let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(ac, animated: true)
                        }
                    }
                }
            } else {
                let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }
        if sender.tag == 5 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let lotrinh = storyboard.instantiateViewController(withIdentifier: "lotrinh") as! LoTrinhViewController
            self.navigationController?.pushViewController(lotrinh, animated: true)
        }
        if sender.tag == 7 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let abouthsu = storyboard.instantiateViewController(withIdentifier: "abouthsu") as! AboutHSUViewController
            self.navigationController?.pushViewController(abouthsu, animated: true)
        }

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
