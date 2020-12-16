//
//  main.swift
//  aoc-day4
//
//  Created by Jürgen Fink on 16.12.20.
//

import Foundation

let input = "/Users/juergen/Nextcloud/Programming/Swift/advent-of-code-2020/aoc-day4/aoc-day4/input.txt"
let contentData = FileManager.default.contents(atPath: input)
let content = String(data:contentData!, encoding:String.Encoding.utf8)
let strings = content!.components(separatedBy: "\n\n").filter{$0 != ""}

var counter : Int = 0

for string in strings {
  if solvePart2(string) {
    counter += 1
  }
}
print(counter)


func solvePart2(_ input: String) -> Bool {

  var passport: [String:String] = [:]
  let passportArray = (input.replacingOccurrences(of: "\n", with: " ", options: .literal, range: nil)).split(separator: " ")

  for element in passportArray {
    passport[String(element.split(separator: ":")[0])] = String(element.split(separator: ":")[1])
  }
  passport["cid"] = nil //can be ignored

  if passport.count < 7 {
    return false
  }

  return validatePassport(passport)

}

func validatePassport(_ passport: [String: String]) -> Bool {

  var result : [Bool] = []

  for key in passport.keys {

    switch key {
      case "byr":
        result.append(validateIsNumberBetween(input: Int(passport[key]!)!, min: 1920, max: 2002))
      case "iyr":
        result.append(validateIsNumberBetween(input: Int(passport[key]!)!, min: 2010, max: 2020))
      case "eyr":
        result.append(validateIsNumberBetween(input: Int(passport[key]!)!, min: 2020, max: 2030))
      case "hgt":
        result.append(validateHeight(input: passport[key]!))
      case "hcl":
        result.append(validateHairColor(input: passport[key]!))
      case "ecl":
        result.append(validateEyeColor(input: passport[key]!))
      case "pid":
        result.append(validateID(input: passport[key]!))
      default:
        break
    }

  }

  return result.allSatisfy({ $0 })

}


func validateIsNumberBetween(input: Int, min: Int, max: Int) -> Bool {

  if input >= min && input <= max {
    return true
  }

  return false
}

func validateHeight(input: String) -> Bool {
  if input.contains("cm") {
    let cm = String(input.split(separator: "c")[0])
    return validateIsNumberBetween(input: Int(cm)!, min: 150, max: 193)
  } else if input.contains("in") {
    let inch = String(input.split(separator: "i")[0])
    return validateIsNumberBetween(input: Int(inch)!, min: 59, max: 76)

  }
  return false
}

func validateHairColor(input: String) -> Bool {
  //0[xX][0-9a-fA-F]+
  let range = NSRange(location: 0, length: input.utf16.count)
  let regex = try! NSRegularExpression(pattern: "^[#][0-9a-fA-F]{6}$")

  if regex.firstMatch(in: input, options: [], range: range) != nil {
    return true
  }

  return false

}

func validateEyeColor(input: String) -> Bool {
  let valids = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
  if valids.contains(input) {
    return true
  }
  return false
}


func validateID(input: String) -> Bool {
  let range = NSRange(location: 0, length: input.utf16.count)
  let regex = try! NSRegularExpression(pattern: "^\\d{9}$")

  if regex.firstMatch(in: input, options: [], range: range) != nil {
    return true
  }
  return false
}



func solvePart1(_ input: String) -> Bool {

  let validKeys = ["ecl", "pid", "eyr", "hcl", "byr", "iyr", "hgt" ]

  var passport: [String:String] = [:]
  let passportArray = (input.replacingOccurrences(of: "\n", with: " ", options: .literal, range: nil)).split(separator: " ")

  for element in passportArray {
    passport[String(element.split(separator: ":")[0])] = String(element.split(separator: ":")[1])
  }

  passport["cid"] = nil

  if passport.count < 7 {
    return false
  }


  return passport.keys.allSatisfy { (element) -> Bool in
    if validKeys.contains(element) {
      return true
    }
    return false
  }

}


