import Foundation


class GPA {
    
    var MaHK:String
    var arrPoint:[Point] = []
    
    
    init(arrpoint:[Point]) {
        self.arrPoint = arrpoint
        self.MaHK = arrpoint[0].MaHK
    }
    
    func GPA() -> String {
        
        var unt: Double = 0
        var grade: Double = 0
        for item in arrPoint {
            if item.Unt_Taken != "0.00" {
                grade = grade + convertToGPA(point: item)*Double(item.Unt_Taken)!
                print(convertToGPA(point: item))
                unt = unt + Double(item.Unt_Taken)!

            }
            else{
                print(convertToGPA(point: item))
            }
        }

        print(grade)
        print(unt)
        if grade != 0 {
            return String(format: "%.2f", grade/unt) + "0"
        }else{
            return "0"
        }
    }
    
    func UNT() -> String {
        var unt: Double = 0
        for item in arrPoint {
            if item.Unt_Taken != "0.00" {
                unt = unt + Double(item.Unt_Taken)!
            }
        }
        if unt != 0 {
            return String(format: "%.2f", unt)
        }else{
            return "0.00"
        }
    }
    func convertToGPA(point: Point) -> Double {
        
        let grade = Double(point.Grade)!
        switch grade {
        case 9...10:
            return 4
        case 8.5..<9:
            return 3.7
        case 7.5..<8.5:
            return 3.3
        case 7..<7.5:
            return 3.0
        case 6..<7:
            return 2.7
        case 5.5..<6:
            return 2.3
        case 5..<5.5:
            return 2
        case 4..<5:
            return 1.7
        case 3..<4:
            return 1.3
        case 2..<3:
            return 1
        case 1..<2:
            return 0.7
        default:
            return 0
        }
    }
}
