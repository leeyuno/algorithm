func dfs(_ item: [Int], computer: [[Int]], visited: inout [Int]) {
    for i in 0 ... item.count - 1 {
        if item[i] == 1 {
            if visited[i] == 0 {
                visited[i] = 1
                dfs(computer[i], computer: computer, visited: &visited)
            }
        }
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    
    var visited = Array(repeating: 0, count: n)
    
    for i in 0 ... computers.count - 1 {
        if visited[i] == 0 {
            visited[i] = 1
            
            dfs(computers[i], computer: computers, visited: &visited)
            result += 1
        }
    }
    
    return result
}
