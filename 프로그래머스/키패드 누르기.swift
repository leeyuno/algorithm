func solution(_ numbers:[Int], _ hand:String) -> String {
    var position = [10, 12]
    
    var result = ""
    
    numbers.forEach {
        if $0 == 1 || $0 == 4 || $0 == 7 {
            result.append("L")
            position[0] = $0
        } else if $0 == 3 || $0 == 6 || $0 == 9 {
            result.append("R")
            position[1] = $0
        } else {
            let left_distance = distance(position[0], t: $0, h: hand)
            let right_distance = distance(position[1], t: $0, h: hand)
            
            if left_distance == right_distance {
                if hand == "right" {
                    position[1] = $0
                    result.append("R")
                } else {
                    position[0] = $0
                    result.append("L")
                }
            } else if left_distance < right_distance {
                position[0] = $0
                result.append("L")
            } else {
                position[1] = $0
                result.append("R")
            }
        }
    }
    
    return result
}

func distance(_ p: Int, t: Int, h: String) -> Int {
    guard p != t else { return 0 }
    let pp = p == 0 ? 11 : p
    let tt = t == 0 ? 11 : t
    
    if pp - 1 == tt || pp + 1 == tt || pp - 3 == tt || pp + 3 == tt {
        return 1
    } else {
        if tt.distance(to: pp).magnitude == 2 || tt.distance(to: pp).magnitude == 4 || pp + 6 == tt || pp - 6 == tt {
            return 2
        } else if tt.distance(to: pp).magnitude == 5 || tt.distance(to: pp).magnitude == 7 || pp + 9 == tt || pp - 9 == tt {
            return 3
        } else if tt.distance(to: pp).magnitude == 8 || tt.distance(to: pp).magnitude == 10 {
            return 4
        }
    }
    
    return 0
}
