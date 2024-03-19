class Solution128 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        
        let set = Set(nums)
        
        var res = 0
        for num in set {
            if !set.contains(num - 1) {
                var tempRes = 1
                var next = num + 1
                while set.contains(next) {
                    tempRes += 1
                    next = next + 1
                }
                res = max(res, tempRes)
            }
        }
        
        return res
    }
}