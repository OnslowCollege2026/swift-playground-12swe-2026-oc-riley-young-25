// The Swift Programming Language
// https://docs.swift.org/swift-book




// The Swift Programming Language
// https://docs.swift.org/swift-book



import Foundation
@main
struct SwiftPlayground {
    static func main() {
        //constants and variable
        let vocabulary: [[String]] = [
            ["Hello", "hola", "gracias",  "lo siento", "bonjour"],
            ["thanks", "gracias", "bueno", "tambien", "cinco"],
            ["Please", "por favor", "adios", "pollo", "siete"],
            ["sorry", "lo siento","si", "y tu", "ocho"],
            ["goodbye", "adios", "abrigo", "hola", "amigo"]
        ]
        var score = 0
        var incorrectAnswerIndices: [Int] = []
        var counter = 0


        while counter < vocabulary.count {


            //show the question
            print("find the translation of \(englishWord)")

            //create an array of options
            allAnswers.forEach { answer in 
                print("- \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score = score + 1
                print("Yes, \(correctWord) is correct")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Sorry! The correct answer is \(correctWord).")
            }

            counter += 1
        }
    
    while incorrectAnswerIndices.count > 0 {
        let index = incorrectAnswerIndices[0]

    }

    }
}