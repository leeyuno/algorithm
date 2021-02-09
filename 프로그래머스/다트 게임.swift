func solution(_ dartResult:String) -> Int {
    let dartList = dartResult.map { $0 }
    
    var calc = [Int]()
    
    var number = ""
    
    for dart in dartList {
        if Int(String(dart)) == nil {
            if let n = Int(number) {
                calc.append(n)
                number = ""
            }
            switch String(dart) {
            case "S":
//                calc[calc.count - 1] = Int(pow(Double(calc.last!), 1))
                calc[calc.count - 1] = calc.last!
            case "D":
//                calc[calc.count - 1] = Int(pow(Double(calc.last!), 2))
                calc[calc.count - 1] = calc.last! * calc.last!
            case "T":
//                calc[calc.count - 1] = Int(pow(Double(calc.last!), 3))
                calc[calc.count - 1] = calc.last! * calc.last! * calc.last!
            case "*":
                if calc.count > 1 {
                    calc[calc.count - 2] = calc[calc.count - 2] * 2
                }
                calc[calc.count - 1] = calc.last! * 2
            case "#":
                calc[calc.count - 1] = calc.last! * -1
            default:
                break
            }
        } else {
            number.append(dart)
        }
    }
    
    return calc.reduce(0, +)
}
