func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String: Int]()

    for order in orders {
        dfs(index: 0, menu: "", characters: order.sorted(), course: course, result: &result)
    }
    
    var answer = [String]()
    
    for length in course {
        let temp = result.filter { $0.key.count == length && $0.value > 1 }
        let maxNum = temp.values.max()
        let menu = temp.filter { maxNum == $0.value }.map { $0.key }
        answer.append(contentsOf: menu)
    }

    return answer
}

func dfs(index: Int, menu: String, characters: [Character], course: [Int], result: inout [String: Int]) {
    if course.contains(menu.count) {
        if result[menu] == nil {
            result.updateValue(1, forKey: menu)
        } else {
            result.updateValue(result[menu]! + 1, forKey: menu)
        }
    }
    
    for i in index ..< characters.count {
        dfs(index: i + 1, menu: "\(menu)\(characters[i])", characters: characters, course: course, result: &result)
    }
}
