class Solution322 {
    // func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    //     if amount == 0 { return 0 }
    //     let inf = 100000

    //     var dp = [Int](repeating: inf, count: amount + 1)
    //     dp[0] = 0

    //     for i in 1...amount {
    //         for el in coins {
    //             if i - el >= 0 && dp[i - el] != inf {
    //                 dp[i] = min(dp[i], dp[i - el] + 1)
    //             }
    //         }
    //     }

    //     return dp[amount] == inf ? -1 : dp[amount]
    // }

    func maxProduct(_ nums: [Int]) -> Int {
        var minValue = nums[0]
        var maxValue = nums[0]
        var result = nums[0]

        for i in 1..<nums.count {
            let tempMax = max(nums[i], minValue * nums[i], maxValue * nums[i])
            minValue = min(nums[i], minValue * nums[i], maxValue * nums[i])
            maxValue = tempMax
            result = max(result, maxValue)
        }

        return result
    }
}