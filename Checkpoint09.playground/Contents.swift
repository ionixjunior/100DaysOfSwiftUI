import UIKit

func getRandomValueOf(numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

let randomValue1 = getRandomValueOf(numbers: [1, 2, 3, 4, 5])
print(randomValue1)

let randomValue2 = getRandomValueOf(numbers: nil)
print(randomValue2)

let randomValue3 = getRandomValueOf(numbers: [])
print(randomValue3)
