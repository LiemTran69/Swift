import Foundation
import UIKit

class DateTime {
    
    let now = Date()
    var startDate = String()
    
    init(){}
    
    //Lay chu của tuan trước
    func getFirstday(myDate: Date) -> Date {
        
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDate)
        comps.weekday = 1 // Monday
        let beginningOfWeek = cal.date(from: comps)!
        return beginningOfWeek
    }
    //Lay ngày theo thứ
    func getDateInWeek(weekday: Int, myDate: Date) -> Date {
        
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDate)
        comps.weekday = weekday // Monday
        let day = cal.date(from: comps)!
        return day
    }
    //Lay ngay va convert sang String
    func getDate (date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd"
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    //Lay thang va convert sang String
    func getMonth (date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MM"
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    //Lay thang va convert sang String
    func getYear (date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "YYYY"
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    //Lấy chuỗi ngày tháng trong tuần
    func getWeekDay(date: Date) -> [String] {
        
        var arrDay: [String] = []
        let firstDay = getFirstday(myDate: date)
        startDate = getDate(date: firstDay)
        print("convert")
        print("----")
        
        for i in 2...8 {
            
            let tmpDay = getDateInWeek(weekday: i, myDate: firstDay)
            let tmpSDay = getDate(date: tmpDay)
            arrDay.append(tmpSDay)
            print(arrDay[i-2])
            
        }
        return arrDay
    }
    func getWeekMonth(date: Date) -> [String] {
        
        var arrDay: [String] = []
        let firstDay = getFirstday(myDate: date)
        startDate = getDate(date: firstDay)
        print("convert")
        print("----")
        
        for i in 2...8 {
            
            let tmpDay = getDateInWeek(weekday: i, myDate: firstDay)
            let tmpSDay = getMonth(date: tmpDay)
            arrDay.append(tmpSDay)
//            print(arrDay[i-1])
            
        }
        return arrDay
    }
    func getWeekYear(date: Date) -> [String] {
        
        var arrDay: [String] = []
        let firstDay = getFirstday(myDate: date)
        startDate = getDate(date: firstDay)
        print("convert")
        print("----")
        
        for i in 2...8 {
            
            let tmpDay = getDateInWeek(weekday: i, myDate: firstDay)
            let tmpSDay = getYear(date: tmpDay)
            arrDay.append(tmpSDay)
//            print(arrDay[i-1])
            
        }
        return arrDay
    }
 
    
    func goToDayFrom(date: Date, number: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: number, to: date)!
    }

}
