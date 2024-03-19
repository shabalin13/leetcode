class Solution139 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {

        let s = [Character("_")] + Array(s)
        let wordSet = Set(wordDict)
        var dp = [Bool](repeating: false, count: s.count)
        dp[0] = true

        for i in 1..<s.count {
            for j in 0..<i {
                if dp[j] && wordSet.contains(String(s[j+1...i])) {
                    dp[i] = true
                    break
                }
            }
        }

        return dp[s.count - 1]
    }
}