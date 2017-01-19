//
//  Animals.swift
//  AC3.2-ProtocolsEverywhere
//
//  Created by Louis Tur on 1/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

protocol Animal {
  var name: String { get }
  var diet: String { get }
  func reproduce() -> Animal
}

class Cat: Animal {
  var name: String = "Cat"
  var diet: String = "Kibble"
  func reproduce() -> Animal {
    return Cat()
  }
}

class Dog: Animal {
  var name: String = "Dog"
  var diet: String = "Kibble"
  func reproduce() -> Animal {
    return Dog()
  }
}

protocol Vehicle {
  var terrain: String { get }
  var speed: Double { get }
  var passengers: Int { get }
  
  func startMoving()
}

class Elephant: Animal, Vehicle {
  var name: String = "Elephant"
  var diet: String = "Leaves"
  
  var terrain: String = "Land"
  var speed: Double = 25.0
  var passengers: Int = 2
  
  func reproduce() -> Animal {
    return Elephant()
  }
  
  func startMoving() {
    print("*Makes Elephant Noise. Starts lumbering along")
  }
}
