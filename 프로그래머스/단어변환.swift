func dfs(_ begin: String, target: String, words: [String], array: [String], result: inout [[String]]) {
    if begin == target {
        result.append(array)
        return
    }
    
    for word in words {
        var correct: Int = 0
        let arrayBegin = begin.map { $0 }
        let arrayWord = word.map { $0 }
        
        for i in 0 ... arrayBegin.count - 1 {
            if arrayBegin[i] == arrayWord[i] {
                correct += 1
            }
        }
        
        if correct == word.count - 1 {
            let index = words.firstIndex(of: word)
            var tempWords = words
            tempWords.remove(at: index!)
            dfs(word, target: target, words: tempWords, array: array + [word], result: &result)
        }
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = [[String]]()
    
    for word in words {
        var correct: Int = 0
        let arrayBegin = begin.map { $0 }
        let arrayWord = word.map { $0 }
        
        for i in 0 ... arrayBegin.count - 1 {
            if arrayBegin[i] == arrayWord[i] {
                correct += 1
            }
        }
        
        if correct == word.count - 1 {
            let index = words.firstIndex(of: word)
            var tempWords = words
            tempWords.remove(at: index!)
            dfs(word, target: target, words: tempWords, array: [word], result: &result)
        }
    }
    
    if result.count > 0 {
        return result.sorted { $0.count < $1.count }.first!.count
    } else {
        return 0
    }
}
