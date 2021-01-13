func solution(_ n:Int) -> Int {
    let decial = String(n, radix: 10)

    let result = Int(String(decial.reversed()), radix: 10)!

    return result
}
