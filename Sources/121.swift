class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        var minPrice = 10_001

        for price in prices {
            minPrice = min(minPrice, price)
            result = max(result, price - minPrice)
        }

        return result
    }
}