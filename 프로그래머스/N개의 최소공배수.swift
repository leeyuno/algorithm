let arr = [2,6,8,14]
let arr = [99, 97, 92, 13]

func solution(_ arr:[Int]) -> Int {

    var count = 1

    var result = 0

    while result == 0 {
        let number = arr.max()! * count
        var visited = Array(repeating: false, count: arr.count)
        for i in 0 ... arr.count - 1 {
            if number % arr[i] == 0 {
                visited[i] = true
            }
        }

        if !visited.contains(false) {
            result = number
            break
        }

        count += 1
    }

    return result
}
