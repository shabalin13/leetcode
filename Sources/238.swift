// class Solution {
//     func productExceptSelf(_ nums: [Int]) -> [Int] {
//         var prefixes = [nums[0]]
//         for i in 1..<nums.count {
//             prefixes.append(prefixes[i - 1] * nums[i])
//         }

//         var suffix = 1
//         var result = [Int]()
//         for i in (1..<nums.count).reversed() {
//             result.append(prefixes[i - 1] * suffix)
//             suffix *= nums[i]
//         }
//         result.append(suffix)

//         return result.reversed()
//     }
// }

class Solution238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var (prefix, suffix, n) = (1, 1, nums.count)
        var product = [Int]()
        
        for i in 0..<n {
            product.append(prefix)
            prefix *= nums[i]
        }
        
        for i in (0..<n).reversed() {
            product[i] *= suffix
            suffix *= nums[i]
        }
        
        return product
    }
}