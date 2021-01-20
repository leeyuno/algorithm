let arr1 = [[2, 3, 2], [4, 2, 4], [3, 1, 4]]
let arr2 = [[5, 4], [2, 4], [3, 1]]

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for i in 0 ... arr1.count - 1 {
        var arr = [Int]()
        var count = 0
        
        while count < arr2[0].count {
            var a = 0
            for j in 0 ... arr2.count - 1 {
                a += arr1[i][j] * arr2[j][count]
            }
            
            arr.append(a)
            count += 1
        }
        result.append(arr)
    }
    
    return result
}
