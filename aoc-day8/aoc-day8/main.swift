//
//  main.swift
//  aoc-day8
//
//  Created by Jürgen Fink on 17.12.20.
//

import Foundation

struct Instruction {
  var instr: String
  var value: Int

  init(_ instr: String, _ value: Int){
    self.instr = instr
    self.value = value
  }
}

let input = "/Users/juergen/Nextcloud/Programming/Swift/advent-of-code-2020/aoc-day8/aoc-day8/input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let lines = content!.components(separatedBy: "\n").filter{$0 != ""}

solvePart2(lines)
func solvePart1(_ lines: [String]){

  let instructions = getInstructions(lines)

  var pointer = 0
  var value = 0
  var iterator = 0

  var usedPointers: [Int] = []

  while(true) {

    switch instructions[pointer].instr {
      case "nop":
        pointer += 1
      case "acc":
        value += instructions[pointer].value
        pointer += 1
      case "jmp":
        pointer += instructions[pointer].value
      default:
        print("This should not happen")
    }

    iterator += 1
    if usedPointers.contains(pointer) {
      print(value)
      break
    } else {
      usedPointers.append(pointer)
    }
  }

}

func solvePart2(_ lines: [String]){

  let instructions = getInstructions(lines)

  var change_pointer = 0

  while true {

    if instructions[change_pointer].instr == "nop" {
      print("Checking index \(change_pointer)")
      var copied = instructions
      copied[change_pointer].instr = "jmp"
      if checkIfLoop(copied) {
        break
      }
    }
    else if instructions[change_pointer].instr == "jmp" {
      print("Checking index \(change_pointer)")
      var copied = instructions
      copied[change_pointer].instr = "nop"
      if checkIfLoop(copied) {
        break
      }
    }

    change_pointer += 1
    if change_pointer == instructions.count {
      break
    }



  }







}

func checkIfLoop(_ instructions: [Instruction]) -> Bool {
  var pointer = 0
  var value = 0

  var usedPointers: [Int] = []
  while(true) {

    switch instructions[pointer].instr {
      case "nop":
        pointer += 1
      case "acc":
        value += instructions[pointer].value
        pointer += 1
      case "jmp":
        pointer += instructions[pointer].value
      default:
        print("This should not happen")
    }

    if pointer == instructions.count {
      print(value)
      return true
    }

    if usedPointers.contains(pointer) {
      print("still in loop")
      return false
    } else {
      usedPointers.append(pointer)
    }
  }
}

func getInstructions(_ lines: [String]) -> [Instruction] {
  var instructions: [Instruction] = []

  lines.forEach{ line in
    let parts = line.components(separatedBy: " ")
    instructions.append(Instruction(parts[0], Int(parts[1]) ?? 0))

  }

  return instructions

}
