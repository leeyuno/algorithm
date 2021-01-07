func dfs(_ path: [String], tickets: [[String]], result: inout [[String]], count: Int) {
    if count + 1 == path.count {
        result.append(path)
        return
    }
    
    let filter = tickets.filter { $0.first == path.last }
    
    for ticket in filter {
        var temp = tickets
        let index = temp.firstIndex(of: ticket)
        
        temp.remove(at: index!)
        
        dfs(path + [ticket.last!], tickets: temp, result: &result, count: count)
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    var result = [[String]]()
    let filter = tickets.filter { $0.first! == "ICN" }

    for ticket in filter {
        var temp = tickets
        let index = tickets.firstIndex(of: ticket)

        temp.remove(at: index!)

        dfs(ticket, tickets: temp, result: &result, count: tickets.count)
    }

    let join = result.map { $0.joined() }

    return result[join.firstIndex(of: join.sorted().first!)!]
}
