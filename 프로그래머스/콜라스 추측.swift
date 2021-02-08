func solution(_ num:Int) -> Int {
    var count = 0
    
    var temp_num = num
    while count < 500 {
        guard temp_num != 1 else { return count }
        
        if temp_num % 2 == 0 {
            temp_num = temp_num / 2
        } else {
            temp_num = temp_num * 3 + 1
        }
        count += 1
    }
    
    return -1
}
