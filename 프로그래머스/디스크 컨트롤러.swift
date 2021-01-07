func solution(_ jobs:[[Int]]) -> Int {
    var time = 0
    var temp_jobs = jobs.sorted { $0[0] < $1[0] }
    
    var result = [[Int]]()

    if jobs.count == 1 {
        return jobs[0][1]
    }
    
    while temp_jobs.count > 0 {
        let filter = temp_jobs.filter{ $0[0] <= time }.sorted { $0[1] + time <= $1[1] + time }
        
        if filter.count == 0 {
            time += 1

            continue
        }
        
        result.append([filter[0][0], time + filter[0][1]])
        
        time += filter[0][1]

        let index = temp_jobs.firstIndex(of: filter[0])
        temp_jobs.remove(at: index!)
    }

    return result.map { $0[1] - $0[0] }.reduce(0, { $0 + $1 }) / jobs.count
}
