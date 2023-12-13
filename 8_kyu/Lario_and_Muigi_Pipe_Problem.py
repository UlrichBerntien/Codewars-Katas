def pipe_fix(nums: list[int]) -> list[int]:
    """
    Returns list of all integers between first and last number in nums.
    Includes first and last number.
    """
    if not nums and nums[0] > nums[-1]:
        # Empty argument of invalid sorted argument
        return None
    return list(range(nums[0],nums[-1]+1,1))
