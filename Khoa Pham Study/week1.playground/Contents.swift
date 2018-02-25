//: Playground - noun: a place where people can play

import UIKit

//var tenbien:kieudulieu = ?
//
//let tenbien:kieudulieu = ?
//
//int, float, double, string, bool

//bam ctr + i de chinh code
//bam command + ? de note code
//bam ctr + command + space hien danh sach symbol
//var co the thay doi gia tri let thi ko

let hi:String = "Xin chao cac ban"
let so1:Int = 3
let so2:Float = 4

let tong = Float(so1) + so2

//kieu chuoi

let ten:String = "Huynh Cong Thai"
let chuoi:String = "Xin chao ban minh ten la \(ten)" //truyen bien vao chuoi

//? va !

var tenbien:Int!  //(truy xuat toi neu nil se bi loi)
var tenbien2:String?  //(truy xuat toi neu nil se duoc bo qua)

let thang:Int = 3

switch thang {
case 1:
    print("La Thang 1")
    break
case 2:
    print("la thang 2")
    break
default:
    print("sai")
}
//Bai tap
//co 3 bien ngay, thang, nam