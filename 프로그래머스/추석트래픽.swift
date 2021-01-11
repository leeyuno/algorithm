func solution(_ lines:[String]) -> Int {
    var array = [[Double]]()

    for line in lines {
        var l = line.split(separator: " ")
        let time = l[1].split(separator: ":")
        l[2].removeLast()
        let end = (Double(time[0])! * 3600 * 1000) + (Double(time[1])! * 60 * 1000) + (Double(time[2])! * 1000)
        array.append([end - (Double(l[2])! * 1000) + 1, end])
    }

    var count = [Int]()

    if array.count == 1 {
        return 1
    }

    for i in 0 ... array.count - 2 {
        var c = 1
        let time = array[i][1]
        for j in i + 1 ... array.count - 1 {

            /*
             문제에 주어진 초당 최대 처리량은 요청의 응답 완료 여부에 관계없이 임의 시간부터 1초(=1,000밀리초)간 처리하는 요청의 최대 개수를 의미한다. 에 따라
             한 작업의 끝시간을 기준으로 두고 1초씩 증가시키면서 만나는 작업의 시작시간을 비교
             기준 작업의 끝시간보다 다음 작업의 시작시간이 더 빠르다면 작업이 겹친다는 의미
             */
            if array[j][0] < time + 1000 {
                c += 1
            }
         }
        count.append(c)
    }

    return count.sorted(by: >)[0]
}
