func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    //대기하는 트럭
    var wait: [Int] = truck_weights
    //다리 길이만큼의 큐
    var bridge = Array(repeating: 0, count: bridge_length)
    //트럭의 무게 합
    var total_weight = 0
    //시간
    var time = 0
    
    //큐가 빌때까지 반복문을 실행
    while !bridge.isEmpty {
        //큐가 한칸씩 이동될 수 있게 제일 앞 큐를 제거
        total_weight -= bridge.removeFirst()
        time += 1
        
        /*
         대기하고 있는 첫번째 트럭과 현재 다리에 진입한 트럭들의 무게 합이 weight보다 작으면 진입
         weight보다 크다면 큐에 빈값을 추가시킴
         */
        if let truck = wait.first {
            if truck + total_weight <= weight {
                total_weight += wait.removeFirst()
                bridge.append(truck)
            } else {
                bridge.append(0)
            }
        }
    }
    
    
    return time
}
