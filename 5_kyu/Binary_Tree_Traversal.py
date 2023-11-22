# Pre-order traversal
def pre_order(node: Node):
    """Returns the content of the binary tree flat in a list in pre-order sequence."""
    if node:
        return [node.data] + pre_order(node.left) + pre_order(node.right)
    else:
        return []

# In-order traversal
def in_order(node):
    """Returns the content of the binary tree flat in a list in in-order sequence."""
    if node:
        return in_order(node.left) + [node.data] + in_order(node.right)
    else:
        return []

# Post-order traversal
def post_order(node):
    """Returns the content of the binary tree flat in a list in post-order sequence."""
    if node:
        return post_order(node.left) + post_order(node.right) + [node.data]
    else:
        return []
