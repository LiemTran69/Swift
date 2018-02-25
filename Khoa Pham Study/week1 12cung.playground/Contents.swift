//: Playground - noun: a place where people can play

import UIKit

let ngay:Int = 20
let thang:Int = 9
let nam:Int = 2016
var nhuan:Bool = false
var hopLe:Bool = true


//kiem tra nam nhuan
if nam % 4 == 0 || (nam % 400 == 0 && nam % 1000 != 0)
{
    nhuan=true
}

//kiem tra ngay thang nam
if ngay < 1 || ngay > 31 || thang < 1 || thang > 12
{
    hopLe = false
}

if (thang == 4 || thang == 6 || thang == 9 || thang == 11) && ngay > 30
{
    hopLe = false
}

if thang == 2
{
    if nhuan && ngay > 29
    {
        hopLe = false
    }
    if nhuan == false && ngay > 28
    {
        hopLe = false
    }
}

if hopLe == false
{
    print("Ngay Thang Nam Nhap Khong Hop Le")
}

switch thang {
case 1:
    if ngay < 20
    {
        print("Cung Ma Ket")
    }
    if ngay >= 20
    {
        print("Cung Bao Binh")
    }
    break
case 2:
    if ngay < 19
    {
        print("Cung Bao Binh")
    }
    if ngay >= 19
    {
        print("Cung Song Ngu")
    }
    break
case 3:
    if ngay < 21
    {
        print("Cung Song Ngu")
    }
    if ngay >= 21
    {
        print("Cung Bach Duong")
    }
    break
case 4:
    if ngay < 20
    {
        print("Cung Bach Duong")
    }
    if ngay >= 20
    {
        print("Cung Kim Nguu")
    }
    break
case 5:
    if ngay < 21
    {
        print("Cung Kim Nguu")
    }
    if ngay >= 21
    {
        print("Cung Song Tu")
    }
    break
case 6:
    if ngay < 22
    {
        print("Cung Song Tu ")
    }
    if ngay >= 22
    {
        print("Cung Cu Giai")
    }
    break
case 7:
    if ngay < 23
    {
        print("Cung Cu Giai")
    }
    if ngay >= 23
    {
        print("Cung Su Tu")
    }
    break
case 8:
    if ngay < 23
    {
        print("Cung Su Tu")
    }
    if ngay >= 23
    {
        print("Cung Xu Nu")
    }
    break
case 9:
    if ngay < 23
    {
        print("Cung Xu Nu")
    }
    if ngay >= 23
    {
        print("Cung Thien Binh")
    }
    break
case 10:
    if ngay < 24
    {
        print("Cung Thien Binh")
    }
    if ngay >= 24
    {
        print("Cung Ho Cap")
    }
    break
case 11:
    if ngay < 22
    {
        print("Cung Ho Cap")
    }
    if ngay >= 22
    {
        print("Cung Nhan Ma")
    }
    break
case 12:
    if ngay < 22
    {
        print("Cung Nhan Ma")
    }
    if ngay >= 22
    {
        print("Cung Ma Ket")
    }
    break
default:
    print("nil")
}
