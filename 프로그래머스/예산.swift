func solution(_ d:[Int], _ budget:Int) -> Int {
    var sort = d.sorted()
    var temp_budget = budget
    
    while sort.first! <= temp_budget {
        temp_budget -= sort.first!
        sort.removeFirst()
        
        if sort.count == 0 {
            break
        }
    }
    
    return d.count - sort.count
}
