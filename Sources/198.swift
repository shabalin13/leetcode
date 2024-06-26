class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0]}
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = nums[0] > nums[1] ? nums[0] : nums[1]
        for i in 2..<nums.count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp[nums.count - 1]
    }
}