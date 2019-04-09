class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var pathNums = Array(count: m, repeatedValue: Array(count: n, repeatedValue: 0))
        return _helper(&pathNums, m-1, n-1)
    }
    private func _helper(inout pathNums:[[Int]], _m: Int, n: Int) -> Int {
    	if(m < 0 || n < 0){
    		return 0
    	}
    	if(m == 0 || n == 0){
    		return 1
    	}
    	if [m][n] != 0 {
    		return pathNums [m][n]
    	}
    	pathNums[m][n] = _helper(&pathNums, m - 1, n) + _helper(&pathNums, m, n - 1)
    	return pathNums [m][n]
    }
}