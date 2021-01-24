func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var tmp_arr1 = Array(repeating: Array(repeating: 0, count: n), count: n)
    var tmp_arr2 = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0 ... n - 1 {
        tmp_arr1[i].append(contentsOf: String(arr1[i], radix: 2, uppercase: false).map { Int(String($0))! })
        tmp_arr2[i].append(contentsOf: String(arr2[i], radix: 2, uppercase: false).map { Int(String($0))! })
        
        tmp_arr1[i].removeSubrange(0 ..< tmp_arr1[i].count - n)
        tmp_arr2[i].removeSubrange(0 ..< tmp_arr2[i].count - n)
    }
    
    var result = Array(repeating: "", count: n)
    
    for i in 0 ... n - 1 {
        for j in 0 ... n - 1 {
            if tmp_arr1[i][j] == 1 || tmp_arr2[i][j] == 1 {
                result[i].append("#")
            } else {
                result[i].append(" ")
            }
        }
    }
    
    return result
}
