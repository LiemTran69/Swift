import Foundation


class Point {
    
    var MaHK:String
    var Subject:String
    var Catalog_Nbr: String
    var Class_Section: String
    var Unt_Taken: String
    var Descr: String
    var Grade_Detail: String
    var Grade: String
    
    init(mahk:String, subject:String, catalog:String, classsection:String, unttaken:String, descr:String, gradedetail:String, grade:String) {
        self.MaHK = mahk
        self.Subject = subject
        self.Catalog_Nbr = catalog
        self.Class_Section = classsection
        self.Unt_Taken = unttaken
        self.Descr = descr
        self.Grade_Detail = gradedetail
        self.Grade = grade
    }
    func convertToGPA(point: String) -> String {
        
        let tmp = Double(self.Grade)!
        
        if tmp >= 9 {
            if point == "1"{
                return "4"
            }
            else{
                return "A"
            }
        }
        if (tmp < 9) && (tmp >= 8.5) {
            if point == "1"{
                return "3.7"
            }
            else{
                return "A-"
            }
        }
        if (tmp < 8.5) && (tmp >= 7.5) {
            if point == "1"{
                return "3.3"
            }
            else{
                return "B+"
            }
        }
        if (tmp < 7.5) && (tmp >= 7) {
            if point == "1"{
                return "3.0"
            }
            else{
                return "B"
            }
        }
        if (tmp < 7) && (tmp >= 6.0) {
            if point == "1"{
                return "2.7"
            }
            else{
                return "B-"
            }
        }
        if (tmp < 6.0) && (tmp >= 5.5) {
            if point == "1"{
                return "2.3"
            }
            else{
                return "A"
            }
        }
        if (tmp < 5.5) && (tmp >= 5) {
            if point == "1"{
                return "2.0"
            }
            else{
                return "C+"
            }
        }
        if (tmp < 5) && (tmp >= 4) {
            if point == "1"{
                return "1.7"
            }
            else{
                return "C"
            }
        }
        if (tmp < 4) && (tmp >= 3) {
            if point == "1"{
                return "1.3"
            }
            else{
                return "C-"
            }
        }
        if (tmp < 3) && (tmp >= 2) {
            if point == "1"{
                return "1.0"
            }
            else{
                return "D+"
            }
        }
        if (tmp < 2) && (tmp >= 1) {
            if point == "1"{
                return "0.7"
            }
            else{
                return "D"
            }
        }
        else{
            if point == "1"{
                return "D-"
            }
            else{
                return "F"
            }
        }
        
    }
    
    func getGPA() -> String {
        return self.convertToGPA(point: "1")
    }
    
    func getCharPoint() -> String {
        return self.convertToGPA(point: "2")
    }
}
