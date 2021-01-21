let arr = [[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]

func solution(_ arr:[[Int]]) -> [Int] {
    var array = [[Int]]()
    
    array.append(contentsOf: dfs(arr: arr))
    
    let count_one = array.flatMap ({ $0 }).filter ({ $0 == 1 }).count
    let count_zero = array.flatMap ({ $0 }).filter ({ $0 == 0 }).count
    
    return [count_zero, count_one]
}

func dfs(arr: [[Int]]) -> [[Int]] {
    var a = Array(repeating: Array(repeating: [Int](), count: arr.count / 2), count: 4)
    var result = [[Int]]()
    
    if !arr.flatMap({ $0 }).contains(0) {
        return [[1]]
    } else if !arr.flatMap ({ $0 }).contains(1) {
        return [[0]]
    }
    
    if arr.count == 2 {
        return arr
    }
    
    for i in 0 ... arr.count - 1 {
        if i >= arr.count / 2 {
            a[2][i % (arr.count / 2)].append(contentsOf: arr[i][0 ..< arr.count / 2])
            a[3][i % (arr.count / 2)].append(contentsOf: arr[i][arr.count / 2 ..< arr.count])
        } else {
            a[0][i % (arr.count / 2)].append(contentsOf: arr[i][0 ..< arr.count / 2])
            a[1][i % (arr.count / 2)].append(contentsOf: arr[i][arr.count / 2 ..< arr.count])
        }
    }
    
    for item in a {
        result.append(contentsOf: dfs(arr: item))
    }
    
    return result
}
