//
//  main.swift
//  aoc-day6
//
//  Created by Jürgen Fink on 17.12.20.
//

import Foundation

let input = "input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let strings = content!.components(separatedBy: "\n\n").filter{$0 != ""}


solvePart2(strings)



func solvePart2(_ input: [String]) {

  var counter: Int = 0
  for string in strings {

    let answers = string.components(separatedBy: "\n").filter{$0 != ""}
    var dict: [String:Int] = [:]

    for answer in answers {
      for c in answer {
        if dict[String(c)] != nil {
          dict[String(c)] = dict[String(c)]! + 1
        } else {
          dict[String(c)] = 1
        }

      }
    }

    if dict.count == 1 {
      counter += dict.count
    } else {
      for value in dict.values {
        if value == answers.count {
          counter += 1
        }
      }
    }


  }

  print(counter)

}




func solvePart1(_ input: [String]) {
  var counter: Int = 0
  for string in strings {
    let trimmed = String(string.filter { !" \n\t\r".contains($0) })
    let unique = Array(Set(trimmed))
    print(unique.count)
    counter += unique.count
    print("---------------")
  }

  print(counter)
}




