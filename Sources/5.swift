class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 1 { return s }

        let s = Array(s)
        var isPalidrome = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        var dp = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (-1, -1), count: s.count), count: s.count)

        for i in 0..<s.count {
            for j in 0..<s.count {
                if i == j {
                    dp[i][j] = (i, j)
                    isPalidrome[i][j] = true
                } else if i - 1 == j {
                    isPalidrome[i][j] = true
                }
            }
        }

        for i in stride(from: s.count - 2, to: -1, by: -1) {
            for j in i + 1..<s.count {
                if s[i] == s[j] {
                    if isPalidrome[i + 1][j - 1] {
                        dp[i][j] = (i, j)
                        isPalidrome[i][j] = true
                    } else {
                        let res1 = dp[i][j - 1]
                        let res2 = dp[i + 1][j]
                        let res3 = dp[i + 1][j - 1]
                        let maxCount = 1 + max(res1.1 - res1.0, res2.1 - res2.0, res3.0 - res3.0)
                        if maxCount == res1.1 - res1.0 + 1 {
                            dp[i][j] = res1
                        } else if maxCount == res2.1 - res2.0 + 1 {
                            dp[i][j] = res2
                        } else {
                            dp[i][j] = res3
                        }
                    }
                } else {
                    let res1 = dp[i][j - 1]
                    let res2 = dp[i + 1][j]
                    let res3 = dp[i + 1][j - 1]
                    let maxCount = 1 + max(res1.1 - res1.0, res2.1 - res2.0, res3.0 - res3.0)
                    if maxCount == res1.1 - res1.0 + 1 {
                        dp[i][j] = res1
                    } else if maxCount == res2.1 - res2.0 + 1 {
                        dp[i][j] = res2
                    } else {
                        dp[i][j] = res3
                    }
                }
            }
        }
        let res = dp[0][s.count - 1]
        return String(s[res.0...res.1])
    }
}