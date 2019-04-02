class Solution {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        var intervals = intervals, i = 0
        while i < intervals.count {
            if newInterval.start < intervals[i].start {
                break
            }
            i += 1
        }
        
        if i > 0 && isOverlapped(newInterval, intervals[i-1]) {
            i = i - 1
        }
        
        var newInterval = newInterval
        while i < intervals.count && isOverlapped(newInterval, intervals[i]) {
            let interval = intervals.remove(at: i)
            newInterval = mergeOverlapped(interval, newInterval)
        }
        
        intervals.insert(newInterval, at: i)
        return intervals
    }
    
    func isOverlapped(_ interval1: Interval, _ interval2: Interval) -> Bool {
        let (left, right) = (interval1.start < interval2.start) ? (interval1, interval2) : (interval2, interval1)
        return right.start <= left.end
    }
    
    func mergeOverlapped(_ interval1: Interval, _ interval2: Interval) -> Interval {
        return Interval(min(interval1.start, interval2.start), max(interval1.end, interval2.end))
    }
}