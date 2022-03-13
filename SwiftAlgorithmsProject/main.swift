//
//  main.swift
//  SwiftAlgorithmsProject
//
//  Created by Yi An Chen on 2022/3/11.
//

import Algorithms
import Foundation

// chain
let names1 = ["Jane", "Elizabeth", "Mary", "Kitty"]
let names2 = ["Daphne", "Eloise", "Francesca", "Hyacinth"]

for name in names1 + names2 {
    print(name)
}

for name in chain(names1, names2) {
    print(name)
}

let tooLow = 0...20
let tooHigh = 80...100
let outOfBounds = chain(tooLow, tooHigh)

let value = 35
print(outOfBounds.contains(value))

let reservedSeats = 0...50
let unavailableSeats = [61, 68, 75, 76, 77, 92]
let disallowed = chain(reservedSeats, unavailableSeats)

let requestedSeat = 39
print(disallowed.contains(requestedSeat))

// chunks
struct Student {
    let name: String
    let grade: String
}

let results = [
    Student(name: "Taylor", grade: "A"),
    Student(name: "Sophie", grade: "A"),
    Student(name: "Bella", grade: "B"),
    Student(name: "Rajesh", grade: "C"),
    Student(name: "Tony", grade: "C"),
    Student(name: "Theresa", grade: "D"),
    Student(name: "Boris", grade: "F"),
]

let studentsByGrade = results.chunked(on: \.grade)

for (grade, students) in studentsByGrade {
    print("Grade: \(grade)")
    
    for student in students {
        print("\t\(student.name)")
    }
    
    print()
}

let studentsByName = results.sorted { $0.name < $1.name }.chunked(on: \.name.first! )

for (firstLetter, students) in studentsByName {
    print(firstLetter)
    
    for student in students {
        print("\t\(student.name)")
    }
    
    print()
}

let pairs = results.chunks(ofCount: 2) // it's not Array, it is Array Slice
let pairsArray = results.chunks(ofCount: 2).map(Array.init) // if you want an Array, use that

for pair in pairs {
    let names = ListFormatter.localizedString(byJoining: pair.map(\.name))
    print(names)
}

// random stable sample
let lotteryBalls = 1...50
let winningNumbers = lotteryBalls.randomSample(count: 70)
print(winningNumbers)

let people = ["Chidi", "Eleanor", "Jason", "Tahani"]
let selected = people.randomStableSample(count: 2)
print(selected)

// stride
let numbers = 1...1000
let oddNumbers = numbers.striding(by: 2)
//let oddNumbers2 = numbers.stride(from: numbers.lowerBound, to: numbers.upperBound, by: 2)

for oddNumber in oddNumbers {
    print(oddNumber)
}

let inputString = "a1b2c3d4e5"
let letters = inputString.striding(by: 2)

for letter in letters {
    print(letter)
}

// uniqued
let allNumbers = [3, 7, 8, 8, 7, 67, 8, 7, 13, 8, 3, 7, 31]
let uniqueNumbers = allNumbers.uniqued().sorted()

for number in uniqueNumbers {
    print("\(number) is a lucky number")
}

struct City {
    let name: String
    let country: String
}

let destinations = [
    City(name: "Hamburg", country: "Germany"),
    City(name: "Kyoto", country: "Japan"),
    City(name: "Osaka", country: "Japan"),
    City(name: "Naples", country: "Italy"),
    City(name: "Florence", country: "Italy"),
]

let selectedCities = destinations.uniqued(on: \.country)

for city in selectedCities {
    print("Visit \(city.name) in \(city.country)")
}

// compactMap
let numbers2 = [10, nil, 20, nil, 30]
//let safeNumbers = numbers2.compactMap { $0 }
let safeNumbers = numbers2.compacted() // lazy when you actually ask for it
print(safeNumbers.count)

// product
let people2 = ["Sophie", "Charlotte", "Maddie", "Sennen"]
let games = ["Mario Kart", "Boomerang Fu"]
let allOptions = product(people, games) // first param should be a Sequence, secoond param should ba a Collection

for option in allOptions {
    print("\(option.0) will play \(option.1)")
}

let range = 1...12
let questionCount = 20
let allMultiples1 = product(range, range).shuffled().prefix(questionCount) // proudct give me a new collection
let allMultiples = product(range, range).randomSample(count: questionCount)

for pair in allMultiples {
    print("\(pair.0) x \(pair.1) is \(pair.0 * pair.1)")
}

let suspects = ["Colonel Mustard", "Professor Plum", "Mrs White"]
let locations = ["kitchen", "library", "studt", "hall"]
let weapons = ["candlestick", "dagger", "lead pipe", "rope"]
let guesses = product(product(suspects, locations), weapons)

for guess in guesses {
    print("Was it \(guess.0.0) in the \(guess.0.1) with the \(guess.1)?")
}

// adjacentPairs
let numbers3 = (1...100).adjacentPairs()


for pair in numbers3 {
    print("Pair \(pair.0) and \(pair.1)")
}

let numbers4 = (1...100).windows(ofCount: 5)

for group in numbers4 {
    let strings = group.map(String.init)
    print(ListFormatter.localizedString(byJoining: strings))
}

// minAndMax
let names = ["John", "Paul", "George", "Ringo"]

if let (first, last) = names.minAndMax() {
    print(first)
    print(last)
}

let scores = [42, 4, 23, 8, 16, 15]
let threeLowest = scores.min(count: 3)
print(threeLowest)


