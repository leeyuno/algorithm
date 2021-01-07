func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students: [Int] = Array(repeating: 1, count: n)
    
    //학생 배열에 여분이 있는 학생들은 2를 입력함
    reserve.forEach { students[$0 - 1] = 2 }
    
    //학생 배열에 체육복을 잃어버린 학생은 0을 입력함, 단 2벌을 가지고 있던 학생은 1을 입력
    lost.forEach {
        if students[$0 - 1] == 2 {
            students[$0 - 1] = 1
        } else {
            students[$0 - 1] = 0
        }
    }
    
    //학생 배열에서 학생이 가지고 있는 체육복 수가 0인 경우 앞 뒤로 계산해서 여분을 가지고 있는 친구가 있을 경우 +1 해주고, 빌려준 친구는 -1 해줌
    for (index, student) in students.enumerated() {
        if index == 0 {
            if student == 0 {
                if students[index + 1] == 2 {
                    students[index] += 1
                    students[index + 1] -= 1
                }
            }
        } else if index == n - 1 {
            if student == 0 {
                if students[index - 1] == 2 {
                    students[index] += 1
                    students[index + 1] -= 1
                }
            }
        } else {
            if student == 0 {
                if students[index - 1] == 2 {
                    students[index] += 1
                    students[index - 1] -= 1
                } else if students[index + 1] == 2 {
                    students[index] += 1
                    students[index + 1] -= 1
                }
            }
        }
    }
    
    //학생배열에서 체육복이 0인 경우 빼고 출력
    return students.filter { $0 != 0 }.count
}
