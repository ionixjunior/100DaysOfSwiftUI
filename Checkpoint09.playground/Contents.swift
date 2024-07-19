struct User {
    static var totalOfUsers = 0

    var firstName: String

    init(firstName: String) {
        self.firstName = firstName
        User.totalOfUsers += 1
    }
}

print(User.totalOfUsers) // Output: 0
var user1 = User(firstName: "Laura")
print(User.totalOfUsers) // Output: 1
var user2 = User(firstName: "Samantha")
print(User.totalOfUsers) // Output: 2
