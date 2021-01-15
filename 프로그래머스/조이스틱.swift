func solution(_ name: String) -> Int {
    //    var result = Array(repeating: "A", count: name.count)
    //    var arrayName = name.map { $0 }
    var stick: [Int] = [0, 0, 0, 0]
    
    let n = Array(repeating: "A", count: name.count)
    
    var visited = Array(repeating: false, count: name.count)
    
    let string = name.map { $0 }
    
    for i in 0 ... string.count - 1 {
        if string[i] == "A" {
            visited[i] = true
        }
    }
    var count = 0
    //n.reduce("", { $0 + $1 }) != name
    while visited.contains(false)  {
        for i in 0 ... name.count - 1 {
            if visited[(count + i) % string.count] == false {
                count = (count + i) % string.count
                stick[2] += i
                visited[count] = true
                break
            } else if visited[(count - i + string.count) % string.count] == false {
                count = (count - i + string.count) % string.count
                stick[3] += i
                
                visited[count] = true
                
                break
            }
            
        }
        
        if Int(string[count].asciiValue!) - Int(UnicodeScalar(n[count])!.value) < 26 - (Int(string[count].asciiValue!) - 65) {
            stick[0] += Int(string[count].asciiValue!) - Int(UnicodeScalar(n[count])!.value)
        } else {
            stick[0] += 26 - (Int(string[count].asciiValue!) - 65)
        }
    }
    
    return stick.reduce(0, { $0 + $1 })
}

print(solution(name))
