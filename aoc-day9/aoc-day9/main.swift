//
//  main.swift
//  aoc-day9
//
//  Created by Jürgen Fink on 17.12.20.
//

import Foundation

let input = "input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let lines = content!.components(separatedBy: "\n").filter{$0 != ""}

var numbers: [Int] = []

lines.forEach { line in
  numbers.append(Int(line)!)
}

let result = solvePart1(numbers)
solvePart2(numbers, lookingFor: result)

func solvePart1(_ numbers: [Int]) -> Int{
  let preamble = 25
  let length = 25
  for index in preamble...numbers.count-1
  {
    let slice = numbers[index-length...index-1]
    if !checkSlice(value: numbers[index], slice: Array(slice)) {
      print("no valid pair found for \(numbers[index])")
      return numbers[index]
    }
  }
  return 0
}

func solvePart2(_ numbers: [Int], lookingFor: Int) {

  for i in 0..<numbers.count {
    for j in i ..< numbers.count {
      let slice = numbers[i..<j]
      let sum = Array(slice).reduce(0, +)
      if sum == lookingFor {
        print(slice.min()!+slice.max()!)
        return
      }
    }
  }
}


func checkSlice(value: Int, slice: [Int]) -> Bool {
  for n in slice {
    for m in slice {
      if n+m == value {
        return true
      }
    }
  }
  return false
}


