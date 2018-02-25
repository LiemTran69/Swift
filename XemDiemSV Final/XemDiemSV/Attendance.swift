import Foundation


class Attendance {
    
    var STRM:String
    var Class_NBR: String
    var Subject:String
    var Descr: String
    var NOABS: Int

    
    init(strm:String, class_n:String, subject:String, descr:String, no:Int) {
        self.STRM = strm
        self.Class_NBR = class_n
        self.Subject = subject
        self.Descr = descr
        self.NOABS = no
    }
}
