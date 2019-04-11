class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true }
            return left?.val == right?.val && isSymmetric(left?.left, right?.right) && isSymmetric(left?.right, right?.left)
        }
        return isSymmetric(root?.left, root?.right)
    }
}