class Solution647 {
    func countSubstrings(_ s: String) -> Int {
        if s.count == 1 { return 1}

        let s = Array(s)
        var isPalidrome = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: s.count), count: s.count)

        for i in 0..<s.count {
            for j in 0..<s.count {
                if i == j {
                    dp[i][j] = 1
                    isPalidrome[i][j] = true
                } else if i - 1 == j {
                    dp[i][j] = 0
                    isPalidrome[i][j] = true
                }
            }
        }

        for i in stride(from: s.count - 2, to: -1, by: -1) {
            for j in i + 1..<s.count {
                if s[i] == s[j] {
                    if isPalidrome[i + 1][j - 1] {
                        dp[i][j] = dp[i][j - 1] + dp[i + 1][j] - dp[i + 1][j - 1] + 1
                        isPalidrome[i][j] = true
                    } else {
                        dp[i][j] = dp[i][j - 1] + dp[i + 1][j] - dp[i + 1][j - 1]
                    }
                } else {
                    dp[i][j] = dp[i][j - 1] + dp[i + 1][j] - dp[i + 1][j - 1]
                }
            }
        }
        return dp[0][s.count - 1]
    }
}