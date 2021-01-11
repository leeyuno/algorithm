func solution(_ a:Int, _ b:Int) -> String {
    let week = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    let day31 = [3, 5, 7, 8, 10, 12]
    //1일을 30일에 넣은 이유는 1월 1일부터 시작하기 때문에 1일은 포함안됨
    let day30 = [1, 4, 6, 9, 11]
    
    var total_day = b
    
    //1월이 입력된 경우 몇 일 차이나는지 바로 계산
    if a == 1 {
        return week[(b - 1) % 7]
    }
    
    
    //1월 부터 ~ 계산일 전 달까지 일수를 합해줌
    for i in 0 ... a - 2 {
        if day31.contains(i + 1) {
            total_day += 31
        } else if day30.contains(i + 1) {
            total_day += 30
        } else {
            total_day += 29
        }
    }
    
    return week[total_day % 7]
}
