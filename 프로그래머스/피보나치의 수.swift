func f(n: Int, count: Int, fibo: inout [Int]) {
    if count == n {
        return
    }
    
    fibo.append((fibo[count - 2] + fibo[count - 1]) % 1234567)
    
    f(n: n, count: count + 1, fibo: &fibo)
}

func solution(_ n:Int) -> Int {
    var result = [0, 1]
    f(n: n, count: 2, fibo: &result)
    
    return (result.removeLast() + result.removeLast()) % 1234567
}
