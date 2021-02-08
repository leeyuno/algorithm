func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    //result0 - 도달했으나 클리어못한사람 // 1 - 스테이지에 도달한 플레이어 수
    var result = Array(repeating: Array(repeating: 0, count: 2), count: N)
    
    var answer = [Int: Double]()
    
    for stage in stages {
        if stage > N {
            
            for i in 0 ... N - 1 {
                result[i][1] += 1
            }
        } else {
            result[stage - 1][0] += 1
            
            for i in 0 ... stage - 1 {
                result[i][1] += 1
            }
        }
    }
    
    for (index, r) in result.enumerated() {
        if r[1] == 0 {
            answer.updateValue(0.0, forKey: index)
        } else {
            answer.updateValue(Double(r[0]) / Double(r[1]), forKey: index + 1)
        }
    }

    return answer.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }.map { $0.0 }
}
