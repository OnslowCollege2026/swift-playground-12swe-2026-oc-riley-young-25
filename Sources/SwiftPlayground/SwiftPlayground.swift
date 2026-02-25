// The Swift Programming Language
// https://docs.swift.org/swift-book

func print(board: [[String]]) {
    for line in board {
        print("\(line[0]) | \(line[1]) | \(line[2])")
        print("--+---+--")

    }
    print()
}

func askForPosition(board: [[String]]) -> [Int]
{
    while true {
        print("Please enter the column number 1-3")
        let userInput = readLine()!
        let columnNumber = Int(userInput)! - 1

        print("Please enter the row number 1-3")
        let userInput2 = readLine()!
        let rowNumber = Int(userInput2)! - 1

        if board[rowNumber][columnNumber] == "." {
            return [rowNumber, columnNumber]
        }
    }
}

@main
struct SwiftPlayground {
    static func main() {
        var player = "O"

        var board = [
            [".", ".", "."], // row 0
            [".", ".", "."], // row 1
            [".", ".", "."], // row 2
        ]
        print(board: board)

        while true {
            //ask for users position
            let position = askForPosition(board: board)
            board[position[0]][position[1]] = player

            if player == "O" {
                player = "X"
            } else {
                player = "O"
            }

            print(board: board)
        }
    }

}
