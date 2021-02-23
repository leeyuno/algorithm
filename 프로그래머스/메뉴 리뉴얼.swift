func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String: Int]()

    for order in orders {
        let visit = Array(repeating: false, count: order.count)
        dfs(visited: visit, menu: "", characters: order.sorted(), course: course, result: &result)
    }
    
    var answer = [String]()
    course.forEach { (course) in
        let newMenu = result.filter { $0.key.count == course && $0.value > 1}
        answer.append(contentsOf: newMenu.filter { $0.value == newMenu.values.max() }.map { $0.key })
    }
    
    return answer.sorted()
}

func dfs(visited: [Bool], menu: String, characters: [Character], course: [Int], result: inout [String: Int]) {
    var temp_visited = visited
    
    if course.contains(menu.count) {
        if result[menu] == nil {
            result.updateValue(1, forKey: menu)
        } else {
            result.updateValue(result[menu]! + 1, forKey: menu)
        }
    }
    
    for i in 0 ... visited.count - 1 {
        guard visited[i] == false else { continue }
        temp_visited[i] = true
        dfs(visited: temp_visited, menu: "\(menu)\(characters[i])", characters: characters, course: course, result: &result)
    }
}
