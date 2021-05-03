func solution(_ info:[String], _ query:[String]) -> [Int] {
    let info_item = info.map { $0.split(separator: " ") }
    let query_item = query.map { $0.components(separatedBy: " ").filter { $0 != "and" } }
    
    var result = [String: [Int]]()
    
    for i in 0 ... info.count - 1 {
        dfs(depth: 0, info: [[String(info_item[i][0]), "-"], [String(info_item[i][1]), "-"], [String(info_item[i][2]), "-"], [String(info_item[i][3]), "-"], [String(info_item[i][4])]], item: [], result: &result)
    }
    
    var answer = [Int]()
    
    result.forEach {
        let sortedValue = $0.value.sorted(by: <)
        result[$0.key] = sortedValue
    }
    
    query_item.forEach {
        var temp_query = $0
        let point = temp_query.removeLast()
        let key = temp_query.reduce("", +)
        if let match = result[key] {
            /*
            var count = 0
            for r in result[key]! {
                if r >= Int(point)! {
                    count += 1
                } else {
                    break
                }
            }
             answer.append(count)
            */
            /*
            let filter = result[key]?.filter({ $0 >= Int(point)! }).count
            answer.append(filter ?? 0)
             */
            
            var start = 0
            var end = match.count
            while start < end {
                let mid = (start + end) / 2
                if match[mid] >= Int(point)! {
                    end = mid
                } else {
                    start = mid + 1
                }
            }
            answer.append(match.count - start)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}

func dfs(depth: Int, info: [[String]], item: [String], result: inout [String: [Int]]) {
    guard depth < 4 else {
        let key = item.reduce("", +)
        if result.keys.contains(key) {
            result[key]?.append(Int(info[0][0])!)
        } else {
            result[key] = [Int(info[0][0])!]
        }
        return
    }
    
    for i in 0 ... 1 {
        var newItem = item
        newItem.append(info[0][i])
        var newInfo = info
        newInfo.removeFirst()
        dfs(depth: depth + 1, info: newInfo, item: newItem, result: &result)
    }
}
