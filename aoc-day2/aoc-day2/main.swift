//
//  main.swift
//  aoc-day2
//
//  Created by Jürgen Fink on 16.12.20.
//

import Foundation

let input = "/Users/juergen/Nextcloud/Programming/Swift/advent-of-code-2020/aoc-day2/aoc-day2/input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let strings = content!.components(separatedBy: "\n").filter{$0 != ""}

var counterP1 = 0
for string in strings {
  if parseLinePart1(string) {
    counterP1 += 1
  }
}
print(counterP1)

var counterP2 = 0
for string in strings {
  if parseLinePart2(string) {
    counterP2 += 1
  }
}
print(counterP2)

func parseLinePart1(_ line: String) -> Bool {

  let strings = line.components(separatedBy: " ")
  let minimum = Int(strings[0].split(separator: "-")[0])!
  let maximum = Int(strings[0].split(separator: "-")[1])!

  let character = strings[1].prefix(1)
  var input = strings[2]
  
  input.removeAll(where: { !character.contains($0) })

  if input.count >= minimum && input.count <= maximum {
    return true
  }

  return false;

}

func parseLinePart2(_ line: String) -> Bool {

  let strings = line.components(separatedBy: " ")
  let firstIndex = Int(strings[0].split(separator: "-")[0])! - 1
  let secondIndex = Int(strings[0].split(separator: "-")[1])! - 1

  let character = strings[1].prefix(1)
  let input = strings[2].map { String($0) } //map to array of strings each containing a single character

  var first : Bool = false
  var second: Bool = false
  if input[firstIndex] == character {
    first = true
  }
  if input[secondIndex] == character {
    second = true
  }

  if first == second {
    return false
  } else {
    return true
  }


}
