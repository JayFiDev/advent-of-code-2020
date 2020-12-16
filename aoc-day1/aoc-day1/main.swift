//
//  main.swift
//  aoc-day1
//
//  Created by Jürgen Fink on 16.12.20.
//

import Foundation

import Foundation

let contentData = FileManager.default.contents(atPath: "input.txt")
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let ints = content!.components(separatedBy: "\n").compactMap{ Int($0) }


func solvePart1(_ ints: [Int]) -> Int {
  for i in ints {
    for j in ints {
      if i + j == 2020 {
        return (i*j)
      }
    }
  }
  return 0
}

func solvePart2(_ ints: [Int]) -> Int {
  for i in ints {
    for j in ints {
      for k in ints {
        if i + j + k == 2020 {
          return (i*j*k)
        }
      }
    }
  }
  return 0
}

print(solvePart1(ints))
print(solvePart2(ints))
