let expression = "100-200*300-500+20"

func solution(_ expression:String) -> Int64 {
    //모든 우선순위
    let arr = [["+", "-", "*"],
             ["+", "*", "-"],
             ["-", "+", "*"],
             ["-", "*", "+"],
             ["*", "+", "-"],
             ["*", "-", "+"]]
//    let arr = [["*", "+", "-"]]
    
    var array = [String]()
    
    var t = ""
    
    var result = [UInt64]()
    
    //일단 배열로 만들어
    expression.forEach {
        if $0 == "+" {
            array.append(t)
            array.append("+")
            t = ""
        } else if $0 == "-" {
            array.append(t)
            array.append("-")
            t = ""
        } else if $0 == "*" {
            array.append(t)
            array.append("*")
            t = ""
        } else {
            t.append($0)
        }
    }
    
    array.append(t)
    
    print(array)
    
    //연산자 우선순위 별로 함수에 넣어 계산
    for a in arr {
        result.append(calc(expression: array, op: a)[0])
    }
    
    //우선순위에따라 계산된 모든 값 중 가장 큰 값 리턴
    return Int64(result.max()!)
}

func calc(expression: [String], op: [String]) -> [UInt64] {
    var temp_ex = expression
    var temp = [String]()
    
    //입력받은 우선순위대로 한개씩 돌림
    for o in op {
        var skip = false
        temp.removeAll()
        
        //입력받은 배열을 한개씩 탐색
        for i in 0 ... temp_ex.count - 1 {
            //스킵이 true면 이번 인덱스까지 연산자 우선순위에 따라 연산이 되어서 배열에 넣으면 안됨 바로 다음 인덱스로 넘김
            if skip {
                skip = false
                continue
            }
            
            //우선순위가 가장 높은 연산자를 만나면
            if temp_ex[i] == o {
                var c: Int64 = 0
                let before = temp.last!
                //연산자에 따라 현재 배열에서 연산자 인덱스 - 1 연산자 인덱스 + 1을 연산해줌
                switch o {
                case "+":
                    c = Int64(before)! + Int64(temp_ex[i + 1])!
                case "-":
                    c = Int64(before)! - Int64(temp_ex[i + 1])!
                case "*":
                    c = Int64(before)! * Int64(temp_ex[i + 1])!
                default:
                    break
                }
                
                //skip변수는 현재 연산자 인덱스 + 1번 숫자까지 게산되어서 그 다음 인덱스를 스킵하기 위한 변수
                skip = true
                temp.removeLast()
                temp.append(String(c))
            } else {
                //연산자 우선순위랑 상관없는 항목은 바로 배열에 집어넣음
                temp.append(temp_ex[i])
            }
        }
        
        //연산자 우선순위와 상관없는 애들 + 연산자 우선순위에따라 연산한 결과를 배열에 다시 담아 처음부터 다시 계산
        temp_ex = temp
    }
    
    //최종적으로 계산이 끝난값을 -면 +로 만들어주고 UInt64값으로 변환
    let result: [UInt64] = temp.map {
        if Int($0)! > 0 {
            return UInt64($0)!
        } else {
            return UInt64(Int($0)! * -1)
        }
    }
    
    return result
}
