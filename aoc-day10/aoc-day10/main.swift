//
//  main.swift
//  aoc-day10
//
//  Created by Jürgen Fink on 17.12.20.
//

import Foundation

import Foundation

let input = "/input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let lines = content!.components(separatedBy: "\n").filter{$0 != ""}

//solvePart1(lines)
solvePart2(lines)

func solvePart1(_ lines: [String]){

  var numbers: [Int] = []

  lines.forEach { line in
    numbers.append(Int(line)!)
  }
  numbers.append(0)
  let sorted = numbers.sorted()

  var ones: Int = 0
  var threes: Int = 1

  for i in 1..<numbers.count {
    if sorted[i] - sorted[i-1] == 1 {
      ones += 1
    } else if sorted[i] - sorted[i-1] == 3 {
      threes += 1
    }
  }

  print(threes*ones)

}

func solvePart2(_ lines: [String]){

  var numbers: [Int] = []

  lines.forEach { line in
    numbers.append(Int(line)!)
  }
  numbers.append(numbers.max()! + 3)

  let sorted = numbers.sorted()
  _ = Combiner(sorted)




}

class Combiner {

  var values: [[Int]] = []

  init(_ sorted: [Int]){

    //recursive version -> took a little bit too long :(
    //create(input: sorted, current: [])
    //print(values.count)

    path(input: sorted)

  }

  func path(input: [Int]) {

    var paths: [Int: Int] = [0: 1]

    for number in input  {
      var nextPath: [Int: Int] = [:]

      for (next, count) in paths {
            if (number - next) <= 3 {
              nextPath[next, default: 0] += count
              nextPath[number, default: 0] += count
            }
          }
          paths = nextPath
    }
    print(paths[input.last!]!)

  }


  func create(input: [Int], current: [Int]) {

    if input.count == 1 {
      values.append(current)
      print(current)
      return
    }

    input.forEach { value in
      if value - input[0] > 0 && value - input[0] <= 3 {
        let splitIndex = input.firstIndex(of: value)!
        let new_input: [Int] = Array(input[splitIndex..<input.endIndex])
        let new_current: [Int] = current + Array(arrayLiteral: input[splitIndex])
        create(input: new_input, current: new_current)
      }
    }
  }
}


