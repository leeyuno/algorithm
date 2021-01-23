func solution(_ n:Int, _ words:[String]) -> [Int] {
    var array = Array(repeating: [String](), count: n)
    
    var last = ""
    for i in 0 ... words.count - 1 {
        //끝말에 이어지지 않는 단어를 말하는 경우
        if !last.isEmpty && last != String(words[i].first!) {
            return [i % n + 1, array[i % n].count + 1]
        }
        
        //이미 말한 단어를 말한 경우
        if array.flatMap ({ $0 }).contains(words[i]) {
            return [i % n + 1, array[i % n].count + 1]
        }
        
        last = String(words[i].last!)
        array[i % n].append(words[i])
    }
    
    return [0, 0]
}
