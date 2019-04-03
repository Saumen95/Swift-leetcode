class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    var res = Int.max
    func dig(_ root: TreeNode?, _ depth: Int) {
        guard let root = root else { return }
        var depth = depth
        depth += 1
        if root.left == nil && root.right == nil {
            res = min(depth, res)
        }
        dig(root.left, depth)
        dig(root.right, depth)
    }
    
    dig(root, 0)
    return res
}
}