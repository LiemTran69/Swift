import Foundation

class TKB {
    
    var Name:String
    var DayOfMonth:Int
    var StartTime: String
    var EndTime: String
    var Color: String
    var Month: Int
    var Year: Int
    var Time: Int
    
    init(name:String, day:Int, start:String, end:String, color:String, month:Int, year:Int) {
        self.Name = name
        self.DayOfMonth = day
        self.StartTime = start
        self.EndTime = end
        self.Color = color
        self.Month =  month
        self.Year = year
        var tmp1 = ""
        for letter in self.StartTime.characters{
            if String(letter) != ":"{
                tmp1 = tmp1 + String(letter)
            }
        }
        self.Time = Int(tmp1)!
    }
}
