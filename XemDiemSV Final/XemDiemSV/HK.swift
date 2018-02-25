import Foundation


class ConvertHK {
    
    func getFront(hk: String) -> String {
        var tmp = ""
        for letter in hk.characters{
            if String(letter) != "3" {
                tmp = tmp + String(letter)
            }
            else{
                break
            }
        }
        return "Học kỳ " + tmp + "."
    }
    func getBack(hk: String) -> String {
        var tmp = ""
        var string = ""
        tmp = tmp + String(hk.characters[hk.characters.index(hk.characters.startIndex, offsetBy: 2)]) + String(hk.characters[hk.characters.index(hk.characters.startIndex, offsetBy: 3)])
        if tmp == "30"{
            string = "1A(TSV)"
        }
        if tmp == "31"{
            string = "1A"
        }
        if tmp == "32"{
            string = "1B"
        }
        if tmp == "33"{
            string = "2A"
        }
        if tmp == "34"{
            string = "2B"
        }
        return string 
    }
    
    func getNameHK(hk: String) -> String {
        return getFront(hk: hk) + " " + getBack(hk: hk)
    }
    
//    func getArrHK(hk: String) -> [String] {
//        
//        var arrHK: [String] = []
//        let thisDate = Date()
//        var year = getYear(date: thisDate)
//        for i in 1...4 {
//            arrHK.append(String(Int32(year)!-i) + "31")
//            arrHK.append(String(Int32(year)!-i) + "32")
//            arrHK.append(String(Int32(year)!-i) + "33")
//            arrHK.append(String(Int32(year)!-i) + "34")
//        }
//        return arrHK
//    }
//    func getYear (date: Date) -> String {
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        
//        let myString = formatter.string(from: date)
//        let yourDate = formatter.date(from: myString)
//        formatter.dateFormat = "YYYY"
//        let myStringafd = formatter.string(from: yourDate!)
//        return myStringafd
//    }

}
