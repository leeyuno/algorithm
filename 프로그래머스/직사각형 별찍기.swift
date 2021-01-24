let tmp = Array(repeating: Array(repeating: "*", count: a), count: b)

tmp.forEach {
    print($0.reduce("", +))
}
