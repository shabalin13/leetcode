class Solution91 {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s).map({ Int(String($0))! })
        if s[0] == 0 {
            return 0
        }
        if s.count == 1 && s[0] != 0 {
            return 1
        }

        var dp = [Int](repeating: 0, count: s.count)
        dp[0] = 1
        if s[1] == 0 {
            if s[0] == 1 || s[0] == 2 {
                dp[1] = 1
            } else {
                return 0
            }
        } else {
            if 11 <= s[0] * 10 + s[1] && s[0] * 10 + s[1] <= 26 {
                dp[1] = 2
            } else {
                dp[1] = 1
            }
        }

        for i in 2..<s.count {
            let prev = s[i - 1]
            let cur = s[i]

            if cur == 0 && prev == 0 {
                return 0
            }

            if cur > 0 {
                dp[i] += dp[i - 1]
            }

            if 10 <= prev * 10 + cur && prev * 10 + cur <= 26 {
                dp[i] += dp[i - 2]
            }
        }

        return dp[s.count - 1]
    }
}