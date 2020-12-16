//
//  main.swift
//  aoc-day5
//
//  Created by Jürgen Fink on 16.12.20.
//

import Foundation

let input = "./input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let strings = content!.components(separatedBy: "\n").filter{$0 != ""}

let test = "FBFBBFFRLR"

var results: [Int] = []

for string in strings {

  //print(string)
  let row = String(string.prefix(7))
  let rowResult = parseRow(row)
  
  let column = String(string.suffix(3))
  let colResult = parseColumn(column)

  //print("\(rowResult), \(colResult)")
  let result = (rowResult * 8) + colResult
  //print(result)

  results.append(result)


}
print(results.max())

var sorted = results.sorted()
print(sorted)

for i in 1...sorted.count - 2 {
  if (sorted[i]  - 1) != sorted[i-1] || (sorted[i] + 1) != sorted[i+1] {
    print(sorted[i])
  }
}

func parseRow(_ row: String) -> Int{

  var min : Int = 0;
  var max : Int = 127;
  for character in row {
//    print("---------------")
//    print(character)
    switch character {
    case "F":
      max = max - (max-min)/2 - 1
      //print("Min \(min) - Max \(max)")
    case "B":
      min = min + (max-min)/2 + 1
      //print("Min \(min) - Max \(max)")
    default:
      break
    }
  }


  return min
}

func parseColumn(_ column: String) -> Int {

  var min : Int = 0;
  var max : Int = 7;
  for character in column {
//    print("---------------")
//    print(character)
    switch character {
    case "L":
      max = max - (max-min)/2 - 1
      //print("Min \(min) - Max \(max)")
    case "R":
      min = min + (max-min)/2 + 1
      //print("Min \(min) - Max \(max)")
    default:
      break
    }
  }


  return min
}

