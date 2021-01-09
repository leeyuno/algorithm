func solution(_ n:Int) -> [Int] {
    var tri = [[Int]]()
    
    enum Type: String {
        case up, down, horizontal
    }
    
    var type: Type = .down
    
    for i in 1 ... n {
        let a = Array(repeating: 0, count: i)
        tri.append(a)
    }
    
    var start = 0
    var end = n - 1
    var count = 1
    var max = n
    
    var x = 0
    var y = 0
    
    while max > 0 {
        switch type {
        case .down:
            for i in start ... end {
                tri[i][x] = count
                count += 1
            }
            x += 1
            type = .horizontal
            max -= 1
        case .up:
            for i in (start ... end).reversed() {
                y -= 1
                tri[i][y] = count
                count += 1
            }
            
            type = .down
            start += 1
            max -= 1
        case .horizontal:
            while tri[end].contains(0) {
                y += 1
                tri[end][y] = count
                
                count += 1
            }
            
            type = .up
            start += 1
            end -= 1
            max -= 1
        }
    }
    
    return tri.flatMap { $0 }
}
