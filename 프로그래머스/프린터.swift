func solution(_ priorities:[Int], _ location:Int) -> Int {    
    var array = [[Int]]()
    
    for (index, item) in priorities.enumerated() {
        array.append([item, index])
    }
    
    var result = [[Int]]()

    while !array.isEmpty {
        if let first = array.first {
			//첫번째 문서보다 우선순위가 높은게 있는경우
            if array.filter({ $0.first! > first.first! }).count > 0 {
                array.append(first)
                array.removeFirst()
            } else {
                //없는경우
                result.append(first)
                array.removeFirst()
            }
        }
    }

    
    //location이 몇번째인지 찾는 for문
    for (index, item) in result.enumerated() {
        if item.last == location {
            return index + 1
        }
    }
    
    return 0
}
