//
//  RelayRacer.swift
//  AC3.2-ProtocolsEverywhere
//
//  Created by Louis Tur on 1/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class Baton {
  var owner: Runner? {
    didSet {
      print("The new owner is \(owner!)")
    }
  }
}

protocol Runner {
  var name: String { get }
  var baton: Baton? { get set }
  
  func passBaton() -> Baton?
  func receive(baton: Baton)
}

class Olympian: Runner, CustomStringConvertible {
  var name: String
  var baton: Baton? = Baton()
  
  var description: String {
    return self.name
  }
  
  init(name: String) {
    self.name = name
  }
  
  func passBaton() -> Baton? {
    let freeHand = self.baton
    self.baton = nil
    
    return freeHand
  }
  
  func receive(baton: Baton) {
    self.baton = baton
    baton.owner = self
  }
}

class RelayRace {
  
  let raceBaton: Baton = Baton()
  let orta: Olympian = Olympian(name: "Orta")
  let jessie: Olympian = Olympian(name: "Jessie")
  let natasha: Olympian = Olympian(name: "Natasha")
  let oleg: Olympian = Olympian(name: "Oleg")
  
  func startRace() {
    orta.receive(baton: raceBaton)
    
    runLap(runner1: orta, runner2: jessie)
    runLap(runner1: jessie, runner2: natasha)
    runLap(runner1: natasha, runner2: oleg)
    
    finishRace(runner: oleg)
  }
  
  func runLap(runner1: Olympian, runner2: Olympian) {
    print("Runner \(runner1) is running!\n\n")
    
    print("Runner \(runner1) is handing off a baton to \(runner2)")
    runner2.receive(baton: runner1.passBaton()!)
    
    print("Runner \(runner2) has the baton!")
  }
  
  func finishRace(runner: Olympian) {
   print("\(runner) has finished the race with the baton!")
  }
  
}
