//: Playground - noun: a place where people can play

import UIKit

var hd1 = DispatchQueue(label: "hanhdong1")
hd1.async {
    for i in 1...5 {
        print(" i " + String(i))
    }
}
for x in 1...5 {
    print(" x " + String(x))
}