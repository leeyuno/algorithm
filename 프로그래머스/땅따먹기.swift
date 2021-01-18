func solution(_ land:[[Int]]) -> Int{
    var temp_land = land

    for i in 1 ... temp_land.count - 1 {
        temp_land[i][0] += max(temp_land[i - 1][1], temp_land[i - 1][2], temp_land[i - 1][3])
        temp_land[i][1] += max(temp_land[i - 1][0], temp_land[i - 1][2], temp_land[i - 1][3])
        temp_land[i][2] += max(temp_land[i - 1][0], temp_land[i - 1][1], temp_land[i - 1][3])
        temp_land[i][3] += max(temp_land[i - 1][0], temp_land[i - 1][1], temp_land[i - 1][2])
    }

    print(temp_land)

    return temp_land.last!.max()!
}

//func dfs(land: [[Int]], selected: Int, arr: [Int], result: inout [[Int]]) {
//    var temp_land = land
//    temp_land.removeFirst()
//
//    if temp_land.count == 0 {
//        result.append(arr)
//        return
//    }
//
//    temp_land[0].remove(at: selected)
//
//    for i in 0 ... temp_land[0].count - 1 {
//        var a = arr
//        a.append(temp_land[0][i])
//        dfs(land: temp_land, selected: i, arr: a, result: &result)
//    }
//}
//
//func solution(_ land:[[Int]]) -> Int{
//    var result = [[Int]]()
//
//    for i in 0 ... land[0].count - 1 {
//        dfs(land: land, selected: i, arr: [land[0][i]], result: &result)
//    }
//
//    var r = [Int]()
//
//    for item in result {
//        r.append(item.reduce(0, { $0 + $1 }))
//    }
//
//    return r.max()!
//}
