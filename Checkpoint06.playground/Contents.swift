import UIKit

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int

    mutating func up(gear: Int) {
        if isInvalid(gear: gear) {
            print("The gear \(gear) is invalid")
            return
        }

        currentGear = gear
        print("Gear changed to \(gear)")
    }

    mutating func down(gear: Int) {
        if isInvalid(gear: gear) {
            print("The gear \(gear) is invalid")
            return
        }

        currentGear = gear
        print("Gear changed to \(gear)")
    }

    private func isInvalid(gear: Int) -> Bool {
        return gear < 1 || gear > 10
    }
}

var mustang = Car(model: "Ford Mustang", numberOfSeats: 4, currentGear: 1)
mustang.up(gear: 2)
mustang.up(gear: 3)
mustang.up(gear: 4)
mustang.up(gear: 5)
mustang.up(gear: 6)
mustang.up(gear: 7)
mustang.up(gear: 8)
mustang.up(gear: 9)
mustang.up(gear: 10)
mustang.up(gear: 11)
mustang.up(gear: 12)
mustang.down(gear: 9)
mustang.down(gear: 8)
mustang.down(gear: 7)
mustang.down(gear: 6)
mustang.down(gear: 5)
mustang.down(gear: 4)
mustang.down(gear: 3)
mustang.down(gear: 2)
mustang.down(gear: 1)
mustang.down(gear: 0)
