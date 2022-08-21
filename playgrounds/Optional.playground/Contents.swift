// Day 11 Optionals

import UIKit

// optional
var age: Int? = nil
age = 10

// unwrapping optional using if let

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters.")
} else {
    print("missing a value.")
}

// unwrapping using guard let

func greet(person: String?) {
    guard let person = person else {
        print("There is no one to greet.")
        return
    }
    
    print("Hello, \(person)! Welcome.")
}

greet(person: "Andy")

// implicitly unwrapped optionals

let address: String! = nil

// nil coalescing

func username(id: Int) -> String? {
    if id == 1 {
        return "ladiesman217"
    } else {
        return nil
    }
}

let samUsername = username(id: 1) ?? "anonymous"

// optional chaining

let cars = ["beetle", "golf", "jetta", "passat"]
let carSelection = cars.first?.uppercased()

// optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(password: String) throws {
    if password == "password" {
        throw PasswordError.obvious
    }
}

// solution using do try catch

do {
    try checkPassword(password: "password")
    print("valid password")
} catch {
    print("invalid password")
}

// solution using try?

if let result = try? checkPassword(password: "password") {
    print("\(result) is a valid password")
} else {
    print("invalid password")
}

// solution using try! - will crash if error is thrown by func

try! checkPassword(password: "secret")
print("valid password")

// failable initializers

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

var student = Person(id: "123456789")

// typecasting

class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
