class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        helper(leftOpen: n - 1, leftClose: n, stack: ["("], curRes: "(", res: &res)
        return res
    }

    private func helper(leftOpen: Int, leftClose: Int, stack: [String], curRes: String, res: inout [String]) {
        if leftOpen == 0 && leftClose == 0 {
            return res.append(curRes)
        } else if leftOpen > 0 && leftClose > 0 {
            let (isValid1, newStack1) = isValidStack(stack: stack, el: "(")
            if isValid1 {
                helper(leftOpen: leftOpen - 1, leftClose: leftClose, stack: newStack1, curRes: curRes + "(", res: &res)
            }

            let (isValid2, newStack2) = isValidStack(stack: stack, el: ")")
            if isValid2 {
                helper(leftOpen: leftOpen, leftClose: leftClose - 1, stack: newStack2, curRes: curRes + ")", res: &res)
            }
        } else if leftOpen == 0 && leftClose > 0 {
            let (isValid, newStack) = isValidStack(stack: stack, el: ")")
            if isValid {
                helper(leftOpen: leftOpen, leftClose: leftClose - 1, stack: newStack, curRes: curRes + ")", res: &res)
            }
        } else {
            let (isValid, newStack) = isValidStack(stack: stack, el: "(")
            if isValid {
                helper(leftOpen: leftOpen - 1, leftClose: leftClose, stack: newStack, curRes: curRes + "(", res: &res)
            }
        }
    }

    private func isValidStack(stack: [String], el: String) -> (Bool, [String]) {
        if el == "(" {
            return (true, stack + ["("])
        } else {
            if stack.isEmpty {
                return (false, stack)
            } else {
                return (true, stack.dropLast())
            }
        }
    }
}