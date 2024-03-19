class Solution36 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var boxSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        var boxEmptyCount = [Int](repeating: 0, count: 9)

        var rowSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        var rowEmptyCount = [Int](repeating: 0, count: 9)

        var columnSets = [Set<Character>](repeating: Set<Character>(), count: 9)
        var columnEmptyCount = [Int](repeating: 0, count: 9)

        for i in 0..<board.count {
            for j in 0..<board[i].count {
                var boxIdx: Int!
                switch (i, j) {
                case (0..<3, 0..<3):
                    boxIdx = 0
                case (0..<3, 3..<6):
                    boxIdx = 1
                case (0..<3, 6..<board[i].count):
                    boxIdx = 2
                case (3..<6, 0..<3):
                    boxIdx = 3
                case (3..<6, 3..<6):
                    boxIdx = 4
                case (3..<6, 6..<board[i].count):
                    boxIdx = 5
                case (6..<board.count, 0..<3):
                    boxIdx = 6
                case (6..<board.count, 3..<6):
                    boxIdx = 7
                case (6..<board.count, 6..<board[i].count):
                    boxIdx = 8
                default:
                    continue
                }
                boxSets[boxIdx].insert(board[i][j])
                rowSets[i].insert(board[i][j])
                columnSets[j].insert(board[i][j])
                if board[i][j] == "." {
                    boxEmptyCount[boxIdx] += 1
                    rowEmptyCount[i] += 1
                    columnEmptyCount[j] += 1
                }
            }
        }

        for i in 0..<9 {
            if boxSets[i].count - 1 + boxEmptyCount[i] != 9 {
                return false
            }
            if rowSets[i].count - 1 + rowEmptyCount[i] != 9 {
                return false
            }
            if columnSets[i].count - 1 + columnEmptyCount[i] != 9 {
                return false
            }
        }

        return true
    }
}