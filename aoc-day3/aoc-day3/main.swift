//
//  main.swift
//  aoc-day3
//
//  Created by Jürgen Fink on 16.12.20.
//

import Foundation

let input = "/input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let strings = content!.components(separatedBy: "\n").filter{$0 != ""}

let result : UInt64 = solvePart2(x: 1, y: 1)
            * solvePart2(x: 3, y: 1)
            * solvePart2(x: 5, y: 1)
            * solvePart2(x: 7, y: 1)
            * solvePart2(x: 1, y: 2)

print(result)

func solvePart2(x: Int, y: Int) -> UInt64 {

  let maxRow = strings.count
  let width = strings[0].count

  var currentX = 0
  var treeCounter : UInt64 = 0

  for row in stride(from: y, to: maxRow, by: y) {
    let currentLine = strings[row].map{String($0)}

    currentX += x
    if currentX >= width {
      currentX = currentX % width
    }
    //print(currentX)
    //print(currentLine)
    if currentLine[currentX] == "#" {
      //print("found a tree at row \(row), x \(currentX)")
      treeCounter += 1
    }

  }
  return treeCounter

}




func solvePart1() {

  let maxRow = strings.count
  let width = strings[0].count
  let x = 3

  var currentX = 0
  var treeCounter = 0

  for row in 1...maxRow-1 {

    let currentLine = strings[row].map{String($0)}

    currentX += x
    if currentX >= width {
      currentX = currentX % width
    }
    //print(currentX)
    print(currentLine)
    if currentLine[currentX] == "#" {
      print("found a tree at row \(row), x \(currentX)")
      treeCounter += 1
    }




  }

  print(treeCounter)
}



