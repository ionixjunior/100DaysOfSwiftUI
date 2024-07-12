import UIKit

class Animal {
    let legs: Int

    init(legs: Int) {
        self.legs = legs
    }

    func speak() {}
}

class Dog: Animal {
    override func speak() {
        print("dog barking")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Corgi dog barking")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Poodle dog barking")
    }
}

class Cat: Animal {
    let isTame: Bool

    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }

    override func speak() {
        print("cat meow")
    }
}

final class Persian: Cat {
    override func speak() {
        print("Persian cat meow")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Lion big cat meow")
    }
}

let corgi = Corgi(legs: 4)
corgi.speak()
print(corgi.legs)

let poodle = Poodle(legs: 4)
poodle.speak()
print(poodle.legs)

let persian = Persian(isTame: true)
persian.speak()
print(persian.legs)

let lion = Lion(isTame: false)
lion.speak()
print(lion.legs)
