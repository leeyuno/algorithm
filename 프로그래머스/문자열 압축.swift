func countStringArray(_ array: [String]) -> Int {
    var resultString: String = ""
    var count: Int = 0
    var tempString: String = ""
    
    var compare: String = ""
    
    array.forEach {
        if compare == "" {
            compare = $0
            count += 1
            tempString = $0
        } else {
            if compare == $0 {
                count += 1
                tempString = "\(count)\($0)"
            } else {
                compare = $0
                resultString.append(tempString)
                tempString = $0
                count = 1
            }
        }
    }
    resultString.append(tempString)
    
    return resultString.count
}

func solution(_ s:String) -> Int {
    var count = 1 //압축갯수 한개씩 증가
    var lengthList = [Int]()
    
    if s.count == 1 {
        return 1
    }
    
    while count < s.count {
        var tempString = s
        var stringArray = [String]()

        let div = (tempString.count / count) - 1
        for _ in 0 ... div {
            let startIndex = tempString.index(tempString.startIndex, offsetBy: 0)
            let endIndex = tempString.index(startIndex, offsetBy: count)

            let range = tempString.index(tempString.startIndex, offsetBy: 0) ..< tempString.index(tempString.startIndex, offsetBy: count)

            stringArray.append(tempString[startIndex ..< endIndex].description)
            tempString.removeSubrange(range)
        }
        if tempString != "" {
            stringArray.append(tempString)
        }
        count += 1

        lengthList.append(countStringArray(stringArray))
    }
    
    var firstItem = lengthList[0]
    
    lengthList.map {
        if firstItem > $0 {
            firstItem = $0
        }
    }
    
    return firstItem
}
