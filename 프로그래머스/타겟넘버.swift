func dfs(depth: Int, sum: Int, number: [Int], target: Int, result: inout Int) {
    if depth >= number.count {
        if sum == target {
            result += 1
        }
        return
    }
    
    dfs(depth: depth + 1, sum: sum + number[depth], number: number, target: target, result: &result)
    dfs(depth: depth + 1, sum: sum - number[depth], number: number, target: target, result: &result)
}

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var result = 0
    dfs(depth: 0, sum: 0, number: numbers, target: target, result: &result)
    
    return result
}
