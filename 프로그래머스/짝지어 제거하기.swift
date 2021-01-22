func solution(_ s:String) -> Int{
    var array = [String]()
    
    for cha in s {
        if array.count == 0 {
            array.append(String(cha))
        } else {
            if String(cha) == array.last! {
                array.removeLast()
            } else {
                array.append(String(cha))
            }
        }
    }
    
    return array.count == 0 ? 1 : 0
}
