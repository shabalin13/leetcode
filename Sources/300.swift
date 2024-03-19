class Solution300 {
    // func lengthOfLIS(_ nums: [Int]) -> Int {
    //     var dp = [Int](repeating: 1, count: nums.count)

    //     for i in 1..<nums.count {
    //         for j in 0..<i {
    //             if nums[j] < nums[i] {
    //                 dp[i] = max(dp[i], dp[j] + 1)
    //             }
    //         }
    //     }

    //     return dp.max()!
    // }

    func lengthOfLIS(_ nums: [Int]) -> Int {
        return helper(nums).count
    }

    func helper(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return nums
        }
        let mid = nums.count / 2
        let left = helper([Int](nums[0..<mid]))
        let right = helper([Int](nums[mid..<nums.count]))
        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var i = 0, j = 0
        var res = [Int]()
        while i < left.count || j < right.count {
            if j < right.count && i < left.count {
                if left[i] < right[j] {
                    res.append(left[i])   
                }
                i += 1
            } else if j == right.count && i < left.count {
                break
            } else {
                res.append(right[j])
                j += 1
            }
        }
        return res
    }
}