// Day 11 Protocals and Extensions

import UIKit

// Protocol

protocol Dog {
    var breed: String { get set }
}

// Conforming to protocal

struct germanShephard: Dog {
    var breed = "German Shephard"
}

func displayBreed(dog: Dog) {
    print("I own a dog. He is a \(dog.breed)")
}

// Protocol Inheritance

protocol Payable {
    func calculateWages(hourlyRate: Int) -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    mutating func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}

struct NewHire: Employee {
    var name: String
    var hireDate: String
    var hourlyRate: Int
    var vacationDays: Int
    func calculateWages(hourlyRate: Int) -> Int {
        return hourlyRate * 40
    }
    func study() {
        print("studying...")
    }
    mutating func takeVacation(days: Int) {
        vacationDays -= days
    }
}

// Extension practice

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()
number.isEven

extension Collection {
    func summarize() {
        print("There are \(count) items in this group.")
        for item in self {
           print(item)
        }
    }
}

let cars = ["VW","BMW","Tesla","GM"]
let bikes = Set(["Yamaha", "Ducati", "Suzuki", "Honda"])
cars.summarize()
bikes.summarize()

// Protocol oriented programming

protocol Person {
    var name: String { get set }
    func greeting()
}

extension Person {
    func greeting() {
        print("Hello. My name is \(name).")
    }
}

struct Student: Person {
    var name: String
}

let tom = Student(name: "Chris")
tom.greeting()
