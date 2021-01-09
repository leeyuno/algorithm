func check(string: String) -> Bool {
    var check = ""
    for item in string.map { $0 } {
        check.append(item)
        
        if check == ")" {
            return false
        } else {
            if check.hasSuffix("()") {
                check.removeLast()
                check.removeLast()
            }
        }
    }
    
    if check == "" {
        return true
    } else {
        return false
    }
}

func r(string: String) -> String {
    var u = ""
    var v = ""
    
    if string == "" {
        return ""
    }
    
    for item in string.map { $0 } {
        let open = u.filter { $0 == "(" }
        let close = u.filter { $0 == ")" }
        
        if open.count > 0 && open.count == close.count {
            v.append(item)
        } else {
            u.append(item)
        }
    }
    
    print("u: \(u) v: \(v)")
    
    if check(string: u) {
        let result = r(string: v)
        return "\(u)\(result)"
        print("64: \(result)")
    } else {
        u.removeFirst()
        u.removeLast()
        
        var tempU = ""
        
        for item in u.map { $0 } {
            if item == "(" {
                tempU.append(")")
            } else {
                tempU.append("(")
            }
        }
        
        let tempString = "(\(r(string: v)))\(tempU)"
        
        return tempString
    }
}

func solution(_ p:String) -> String {
    var check = ""
    let map_p = p.map { $0 }
    
    for item in map_p {
        check.append(item)
        if check == ")" {
            break
        } else {
            if check.hasSuffix("()") {
                check.removeLast()
                check.removeLast()
            }
        }
    }
    
    if check == "" {
        return p
    }
    
    let result = r(string: p)
    
    return result
}
