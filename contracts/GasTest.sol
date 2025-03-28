// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Gas {
    uint256 public total;

    // [1,2,3,4,5,100]
    function demo(uint256[] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length;
        for (uint256 index = 0; index < len; ++index) {
            uint256 num = nums[index];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }
}