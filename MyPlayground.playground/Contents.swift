import Foundation
//1
struct MyStruct {
    var myVar: String
    
    init() {
        myVar = "Hello"
    }
    
    init(_ value: String) {
        myVar = value
    }
}
let myObj = MyStruct()
let myObj2 = MyStruct("World")
print(myObj.myVar)
print(myObj2.myVar)

//2
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let p1 = Person(name: "John")
let p2 = p1
p2.name = "Mary"
print(p1.name)

//3
let queue = DispatchQueue(label: "com.queue.test", attributes: .concurrent)
let group = DispatchGroup()

queue.async(group: group) {
    for i in 0..<3 {
        print("Task 1 - \(i)")
    }
}
queue.async(group: group) {
    for i in 0..<3 {
        print("Task 2 - \(i)")
    }
}
group.notify(queue: DispatchQueue.main) {
    print("Task completed")
}

// 4

class Vehicle {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Car: Vehicle {
    var speed: Int
    init(name: String, speed: Int) {
        self.speed = speed
        super.init(name: name)
    }
}
let vehicle: Vehicle = Car(name: "Toyota", speed: 60)
//print(vehicle.speed)

//5
class MyClass {
    lazy var myVar: String = {
        print("John")
        return "Hellow"
    }()
    init() {
        print("Initialising class")
    }
}
let myObj1 = MyClass()
print("Object created")
print(myObj1.myVar)

//6
struct Book {
    let title: String
    let author: String
}
let books = [Book(title: "A", author: "John"),
             Book(title: "B", author: "May")]
let booksTitle = books.map { $0.title }
print(booksTitle)

// 7

class myClass1<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}
let obj1 = myClass1<Int>(value: 1)
let obj2 = myClass1<String>(value: "John")

print(obj1.value)
print(obj2.value)

// 8 : the number of designated initializers and convenience initializers in a class.

// 9 : https://leetcode.com/problems/ransom-note/description/

// 10: Sum of digits of number

// 11

var a1 = [1,2,3,4,5]
var a2 = a1
a2.append(6)
var x = a1.count

func sumOfDigits() {
    var num = 158
    var res = 0
    while num > 0 {
        var remainder = num % 10
        res += remainder
        num = num / 10
    }
    print(res)
}
sumOfDigits()

