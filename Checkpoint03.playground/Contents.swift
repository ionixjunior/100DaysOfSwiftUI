import UIKit

for number in 1...100 {
    let multipleOf3 = number.isMultiple(of: 3)
    let multipleOf5 = number.isMultiple(of: 5)

    if multipleOf3 && multipleOf5 {
        print("FizzBuzz")
    } else if multipleOf3 {
        print("Fizz")
    } else if multipleOf5 {
        print("Buzz")
    } else {
        print(number)
    }
}
