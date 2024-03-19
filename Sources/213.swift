class Solution213 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0]}
        if nums.count == 2 { return max(nums[0], nums[1])}

        let count = nums.count
        var dp1 = [Int](repeating: 0, count: count)
        var dp2 = [Int](repeating: 0, count: count)

        dp1[0] = nums[0]
        dp1[1] = nums[0] > nums[1] ? nums[0] : nums[1]
        dp2[0] = 0
        dp2[1] = nums[1]

        for i in 2..<count {
            if i != count - 1 {
                dp1[i] = max(dp1[i - 2] + nums[i], dp1[i - 1])
            }
            dp2[i] = max(dp2[i - 2] + nums[i], dp2[i - 1])
        }

        return max(dp1[count - 2], dp2[count - 1])
    }
}