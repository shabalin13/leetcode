class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // var dict = [[Character] : [String]]()
        
        // for str in strs {
        //     let strSorted = str.sorted()
        //     dict[strSorted, default: []].append(str)
        // }

        // return Array(dict.values)
        
        Dictionary(grouping: strs, by: { String($0.sorted()) }).values.map { $0 }
    }
}