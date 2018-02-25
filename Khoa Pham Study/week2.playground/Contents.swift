//: Playground - noun: a place where people can play

import UIKit

//Mang 1 chieu

//c1
//var mang:Array<Int> = Array<Int>() //Khai bao mang rong
//mang = [8,9]
//var mang2:Array<Int> = [5,7,12]
////c2
//let mang3:[String] = []
//let mang4:[String] = ["Hello","Hi"]

//mang2.count //dem so luong phan tu cua mang do
//mang2.append(3) //them phan tu vao cuoi mang
//mang2.insert(5, at: 2)  //them phan tu 5 vao vi tri thu 2

//Mang Nhieu Chieu

//var mang:Array<Array<String>> = Array<Array<String>>()
//var mang2:Array<Array<String>> = [["Helle","Hi"],["iOS","Android","Unity"]]

//Tu Dien

//var dic:Dictionary<String,Int> = Dictionary<String, Int>()
//var dic2:Dictionary<String,Int> = ["Mot":1, "Hai":2]
//
//dic2["Mot"]
//dic2["Hai"]
//
//dic2["Ba"] = 3
//print(dic2)

//Vong Lap

//var i = 0
//
//while i<5 {
//    i += 1
//}

//var arr:[Int] = [1,2,7,3,4,5]
//
//for i in 0..<arr.count
//{
//    print(arr[i])
//}
//
//for i in arr
//{
//    print(i)
//}
//
//for (index, value) in arr.enumerated()
//{
//    print(index, value)
//}
//
//var dic: Dictionary<String, Int> = ["Hai":2, "Nam":5, "Chin":9]
//    
//for i in dic
//{
//    print(i.key, i.value)
//}

//struct SanPham
//{
//    var id:Int
//    var name:String
//    var price:Double
//    var des:String
//    var cat:Int
//    
//    init(){
//        id = 0
//        name = ""
//        price = 0
//        des = ""
//        cat = 0
//    }
//    
//    init(id:Int, name:String, price:Double,des:String, cat:Int){
//        self.id = id
//        self.name = name
//        self.price = price
//        self.des = des
//        self.cat = cat
//    }
//    
//    func showName()
//    {
//        print("San pham co ten la \(self.name)")
//    }
//}
//
//let sp:SanPham = SanPham(id: 1, name: "Tui xach sieu deo", price: 100000000, des: "da ca saiu nguyen chat", cat: 1)
//
//sp.showName()

//class SanPham
//{
//    var id:Int!
//    var name:String?
//    var price:Double!
//    
//    init(){
//        id = 0
//        name = ""
//        price = 0
//    }
//    
//    init(id:Int, name:String, price:Double){
//            self.id = id
//            self.name = name
//            self.price = price
//    }
//}
//
//let sp:SanPham = SanPham(id: 1, name: "Tui xach", price: 1000000)
//
//print(sp.name!)
//
////Ham
//
//func Tinh()
//{
//    print(1+4)
//}
//
//Tinh()
//
//
//func Tinh2(so1:Int, so2:Int)
//{
//    let tong = so1 + so2
//    print(tong)
//}
//
////Tinh()
////
////Tinh2(so1: 7, so2: 8)
//
//func Tinh(so1:Int, so2:Int) -> Int
//{
//    let tong = so1 + so2
//    return tong
//}
//
//func Tinh3(so1: inout Int, so2: Int)
//{
//    so1 = so1 + so2
//}

func Tinh(so1:Int, so2:Int, completion:(String)->())
{
    let tong = so1 + so2
    completion(String(tong))
}

// bai tap ve nha tao doi tuong ten la phan so (kiem tra tinh dung sai cua phan so), viet ham rut gon phan so
