class Solution347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int : Int]()

        for num in nums {
            dict[num, default: 0] += 1
        }

        return Array(dict.sorted(by: { $0.1 > $1.1 }).map({ $0.0 })[0..<k])
    }
}