// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

/// Function listing all the possible controls. This function asks the user for an input 1-6 and then returns the number chosen.
func menuChoice() -> Int {
    print("""
    === Stall Owner Controls ===
    1. Add kumara stock
    2. View current stock
    3. View previous sales records
    4. Show summary information

    === Customer Controls ===
    5. Buy kumara
    
    === Exit ===
    6. Exit
    """)
    while true {
        if let input = readLine() {
            if let number = Int(input), number > 0, number <= 6 {
                return number
            } else {
                print("Please enter a valid number 1-6")
            }
        } else {
            print("Please enter a valid number 1-6")
        }
    }  
}

/// A function for adding kumara to the stock. The user has entered an input and this function makes sure it doesn't exceed the maximum capacity and then returns the new stock amount.
func addKumura(currentStock: Double, amount: Double, maxCapacity: Double, minimumPurchaseAmount: Double) -> Double {
    if amount < 0.1 {
        print("Amount must be at least \(minimumPurchaseAmount)kg")
        return currentStock
    } else if amount + currentStock > maxCapacity {
        print("Stock cannot exceed \(maxCapacity)kg")
        return currentStock
    } else {
        print("Added \(amount)kg of kumara.")
        return currentStock + amount
    }
}

/// A function for printing the stock message.
func stockMessage(stock: Double) -> String {
    return "There is \(stock)kg of kumara in stock"
} 

/// Function that prints the purchase history if conditions are met
func viewHistory(purchaseHistory: [[Double]]) {
    if purchaseHistory.isEmpty {
        print("You have no purchases")
    } else {
        print("Here is all the customer purchase history:")

        let count = min(purchaseHistory[0].count, purchaseHistory[1].count, purchaseHistory[2].count) // Prevents crashes by not letting the for loop go on forever

        for i in 0..<count {
            print("Amount purchased = \(purchaseHistory[0][i])kg at $\(purchaseHistory[1][i]). Stock at the time = \(purchaseHistory[2][i])kg")
        }
        
    }

}

/// Function that calculates the averages of the weight and money earned of all purchases
func showSummaryInformation(purchaseHistory: [[Double]]) {
    let totalWeight: Double = purchaseHistory[0].reduce(0, +)
    print("Total Weight Sold =", totalWeight)
    let totalMoney: Double = purchaseHistory[1].reduce(0, +)
    print("Total Money Earned =", totalMoney)
}

/// A function to buy kumura
func buyKumura(currentStock: Double, amountPurchased: Double, minimumPurchaseAmount: Double, kumuraCost: Double, bagCost: Double, bagCapacity: Double, bagAmount: Double, purchaseHistory: [[Double]]) -> (Double, [[Double]], Double) {    

    // Returns original values if the user selected less kumura than they are allowed
    if amountPurchased < minimumPurchaseAmount {
        print("Amount must be at least \(minimumPurchaseAmount)kg")
        return (currentStock, purchaseHistory, bagAmount)

    } else {
         // Returns original values if the kumara shop doesnt have enough stock
        if currentStock - amountPurchased < 0{
            print("You cannot buy \(amountPurchased)kg of kumura. Stock only has \(currentStock)kg available.")
            return (currentStock, purchaseHistory, bagAmount)

        } else {

            var cost: Double = 0
            var newBagAmount: Double = 0
            (cost, newBagAmount) = calculateCost(amountPurchased: amountPurchased, kumuraCost: kumuraCost, bagCost: bagCost, bagCapacity: bagCapacity, bagAmount: bagAmount)

            print("Bought \(amountPurchased)kg of kumara at $\(cost)")

            let newPurchaseHistory = storePurchase(currentStock: currentStock, amountPurchased: amountPurchased, moneyEarned: cost, purchaseHistory: purchaseHistory)

            return (currentStock - amountPurchased, newPurchaseHistory, newBagAmount)
        }

    }   
    
}

/// Calculates the cost for the kumura plus the cost for the bags and removes the bag amount.
func calculateCost(amountPurchased: Double, kumuraCost: Double, bagCost: Double, bagCapacity: Double, bagAmount: Double) -> (Double, Double) {

    let unrounded = (amountPurchased / bagCapacity)
    let bagsNeeded = ceil(unrounded)

    let newBagAmount = bagAmount - bagsNeeded

    let totalCost = (amountPurchased * kumuraCost) + (bagsNeeded * bagCost)

    return (totalCost, newBagAmount)

}

/// This function stores the amount purchased, money earned and stock at the time into the purchaseHistory array
func storePurchase(currentStock: Double, amountPurchased: Double, moneyEarned: Double, purchaseHistory: [[Double]]) -> [[Double]] {
    var newPurchaseHistory = purchaseHistory

    newPurchaseHistory[0].append(amountPurchased)
    newPurchaseHistory[1].append(moneyEarned)
    newPurchaseHistory[2].append(currentStock)

    return newPurchaseHistory
}

@main
struct SwiftPlayground {
    static func main() {

        let minimumPurchaseAmount:Double = 0.1 // kg
        let maxCapacity:Double = 50 // kg
        let kumuraCost: Double = 3 // dollars per kg
        let bagCost: Double = 0.2 // dollars per bag
        let bagCapacity: Double = 5 // kg
        var bagAmount: Double = 5000

        var kumuraInStock:Double = 0
        
        var purchaseHistory:[[Double]] = [
            [], // Amount purchased.
            [], // Money earned
            [] // Stock at the time of purchase.
        ]

        // Repeats the same menu options until the user breaks the loop. This is so the user can use the menu multiple times
        while true {
            let menuChosen = menuChoice()
        
            if menuChosen == 1 {
                print("Add kumara:")
                if let input = readLine() {
                    if let number = Double(input){
                        kumuraInStock = addKumura(currentStock: kumuraInStock, amount: number, maxCapacity: maxCapacity, minimumPurchaseAmount: minimumPurchaseAmount)
                    } else {
                        print("Please enter a valid number")
                    }
                }
            }

            if menuChosen == 2 {
                print(stockMessage(stock: kumuraInStock))
            }

            if menuChosen == 3 {
                viewHistory(purchaseHistory: purchaseHistory)
            }

            if menuChosen == 4 {
                showSummaryInformation(purchaseHistory: purchaseHistory)
            }

            if menuChosen == 5 {
                print("Buy kumura (kg):")
                if let input = readLine() {
                    if let number = Double(input) {
                        (kumuraInStock, purchaseHistory, bagAmount) = buyKumura(currentStock: kumuraInStock, amountPurchased: number, minimumPurchaseAmount: minimumPurchaseAmount, kumuraCost: kumuraCost, bagCost: bagCost, bagCapacity: bagCapacity, bagAmount: bagAmount, purchaseHistory: purchaseHistory)
                    } else {
                        print("Please enter a valid number")
                    }
                }
            }

            // Ends the program
            if menuChosen == 6 {
                break
            }
        }
    }
}