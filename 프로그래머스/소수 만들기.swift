func solution(_ nums:[Int]) -> Int {
    var result = 0
    
    var array = nums
    
    while array.count >= 3 {
        print(array)
        let first = array.removeFirst()
        for i in 0 ... array.count - 2 {
            for j in i + 1 ... array.count - 1 {
                if isPrime(array[i] + array[j] + first) {
                    result += 1
                }
            }
        }
    }

    return result
}

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
