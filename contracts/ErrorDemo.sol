// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorDemo {
    function testRevert(uint256 _x) external pure {
        if (_x > 10) {
            revert("_x > 10");
        }
    }

    // 自定义错误
    error MyError(address call, uint256 _i);

    function testCustomError(uint256 _x) external view {
        if (_x > 10) {
            revert MyError(msg.sender, _x);
        }
    }
}