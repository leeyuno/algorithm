func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var left: Int64 = 0
    var right: Int64 = Int64(times.max()! * n)
    var mid: Int64 = (left + right) / 2
    var answer: Int64 = right
    
    while left <= right {
        mid = (left + right) / 2
        var possible: Int64 = 0
        
        for time in times {
            possible = possible + Int64(Int(mid) / time)
        }
        
        if possible >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return answer
}
