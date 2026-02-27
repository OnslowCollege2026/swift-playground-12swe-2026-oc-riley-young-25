// The Swift Programming Language
// https://docs.swift.org/swift-book



func menuChoice() -> Int {
    print("""
    ==== Egg Shop ====
    1. Add eggs
    2. Sell eggs
    3. Show current stock
    4. Show total eggs sold
    5. Exit
    Choose an option:
    """)
    while true {
        if let input = readLine() {
            if let number = Int(input), number > 0, number <= 5 {
                return number
            } else {
                print("Please enter valid number 1-5")
            }
        } else {
            print("Please enter valid number 1-5")
        }
    }
    
    
}

func addEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
}

func sellEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock - amount
}

func stockMessage(stock: Int) -> String {
    return "There is \(stock) eggs in stock 🥚"
} 

func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    return currentSold + amount
}


@main
struct SwiftPlayground {
    static func main() {
        var eggsInStock = 0
        var eggsSold = 0
        while true{
            let menuChosen = menuChoice()

            if menuChosen == 1 {
                print("Add egg amount🥚")
                if let input = readLine() {
                    if let number = Int(input), number > 0 {
                        eggsInStock = addEggs(currentStock: eggsInStock, amount: number)
                    } else {
                        print("Please enter a valid number🥚")
                    }
                } else {
                    print("Please enter a valid number🥚")
                }
            }

            if menuChosen == 2 {
                print("Sell egg amount🥚")
                if let input = readLine() {
                    if let number = Int(input), number > 0 {
                        eggsInStock = sellEggs(currentStock: eggsInStock, amount: number)
                        eggsSold = updateSoldCount(currentSold: eggsSold, amount: number)
                    } else {
                        print("Please enter a valid number🥚")
                    }
                } else {
                    print("Please enter a valid number🥚")
                }

            }

            if menuChosen == 3 {
                print(stockMessage(stock: eggsInStock))
            }

            if menuChosen == 4 {
                print("You sold \(eggsSold) total eggs🥚")
            }

            if menuChosen == 5 {
                print("Thank you for using the egg shop🥚")
                break
            }
        }
    }
}