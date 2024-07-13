import UIKit

protocol Building {
    var numberOfRoms: Int { get }
    var cost: Int { get }
    var estateAgentName: String { get }

    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("This building has \(numberOfRoms) rooms, cost \(cost) and the name of the estate agent is \(estateAgentName)")
    }
}

struct House: Building {
    var numberOfRoms: Int
    var cost: Int
    var estateAgentName: String
}

struct Office: Building {
    var numberOfRoms: Int
    var cost: Int
    var estateAgentName: String
}

let house = House(numberOfRoms: 3, cost: 100_000, estateAgentName: "Samantha Smith")
house.salesSummary()

let office = Office(numberOfRoms: 12, cost: 750_000, estateAgentName: "Elisa Brown")
office.salesSummary()
