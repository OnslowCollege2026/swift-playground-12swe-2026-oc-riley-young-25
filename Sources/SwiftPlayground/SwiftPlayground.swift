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

    let number = Int(readLine()!)!
    return number
}
func addEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
}

func sellEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock - amount
}

func stockMessage(stock: Int) -> String {
    return "there is \(stock) eggs in stock 🥚🥚🥚🥚🥚"
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
                print("add egg amount")
                let input = Int(readLine()!)!
                eggsInStock = addEggs(currentStock: eggsInStock, amount: input)
            }

            if menuChosen == 2 {
                print("sell egg amount")
                let input = Int(readLine()!)!
                eggsInStock = sellEggs(currentStock: eggsInStock, amount: input)
                eggsSold = updateSoldCount(currentSold: eggsSold, amount: input)
            }

            if menuChosen == 3 {
                print(stockMessage(stock: eggsInStock))
            }

            if menuChosen == 4 {
                print("you sold \(eggsSold) total eggs")
            }

            if menuChosen == 5 {
                print("ahh poo")
                break
            }
        }
    }
}
