func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress: [Int] = progresses
    var speed = speeds
    
    var result = [Int]()

    while !progress.isEmpty {
    	//각 기능을, 각각 속도로 작업
        for i in 0 ... speed.count - 1 {
            progress[i] += speed[i]
        }
        
        //앞에서부터 몇개의 작업이 100%가 넘었는지 담는 변수
        var cnt = 0
        //첫번째 작업이 100%가 넘으면
        if progress.first! >= 100 {
            
            //앞에서부터 100%작업된 기능을 구하고, 차례로 제거해준다
            while progress.first! >= 100 {
                cnt += 1
                progress.removeFirst()
                speed.removeFirst()
                
                if progress.isEmpty {
                    break
                }
            }
            
            result.append(cnt)
        }
    }

    return result
}
