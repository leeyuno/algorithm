func solution(_ new_id:String) -> String {
    var new = ""
    
    new_id.forEach {
        if $0.isLowercase || Int(String($0)) != nil || $0 == "." || $0 == "_" || $0 == "-" {
            if !(new.isEmpty && $0 == ".") && !(new.last == "." && $0 == ".") {
                new.append($0)
            }
        } else {
            if $0.isUppercase {
                new.append($0.lowercased())
            }
        }
    }
    
    if new.last == "." {
        new.removeLast()
    }
    
    if new.count > 15 {
        new.removeSubrange(new.index(after: new.index(new.startIndex, offsetBy: 14)) ..< new.endIndex)
    } else if new.count <= 2{
        if new.count <= 2 {
            if new.isEmpty {
                new = "a"
            }
            
            while new.count < 3 {
                new.append(new.last!)
            }
        }
    }

    
    if new.last == "." {
        new.removeLast()
    }
    
    return new
}
