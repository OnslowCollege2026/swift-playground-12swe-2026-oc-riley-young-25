// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let maximumItemVolume = 2.0
        
        
        print("Enter the room length: ")
        if let userinput = readLine(), let roomLength = Double(userinput){
            print("Enter the room width: ")
            if let userinput = readLine(), let roomWidth = Double(userinput){
                print("Enter the room height: ")
                if let userinput = readLine(), let roomHeight = Double(userinput){
                    let roomArea = roomLength * roomWidth
                    let roomVolume = roomArea * roomHeight

                    print("room area:", roomArea)
                    print("room volume:", roomVolume)

                    let furnitureVolume = [1.2, 0.8, 2.5, 0.6, 1.0]

                    var totalFurnitureVolume = 0.0

                    furnitureVolume.enumerated().forEach {index, volume in
                        print("item \(index + 1): \(volume) m3")
                        if volume > maximumItemVolume {
                            print("oversize item")
                        }
                        totalFurnitureVolume += volume
                    }
                let usableVolume = roomVolume - totalFurnitureVolume
                print("usable vlume: \(usableVolume) m3")
                }

            }

        }

    }

}
