func solution(_ s:String) -> [Int] {
    var temp_s = s
    temp_s.removeFirst()
    temp_s.removeLast()
    
    var array = [[Int]]()
    
    while temp_s.contains("}") {
        array.append(temp_s[temp_s.index(after: temp_s.firstIndex(of: "{")!) ..< temp_s.firstIndex(of: "}")!].split(separator: ",").map { Int($0)! })
        temp_s.removeSubrange(temp_s.firstIndex(of: "{")! ... temp_s.firstIndex(of: "}")!)
    }

    array = array.sorted { $0.count < $1.count }

    var result = [Int]()

    for a in array {
        if result.isEmpty {
            result.append(a[0])
        } else {
            for aa in a {
                if !result.contains(aa) {
                    result.append(aa)
                }
            }
        }
    }
    return result
}
