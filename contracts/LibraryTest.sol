// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library MathTest {
    function math(int256 x, int256 y) internal pure returns (int256) {
        return x > y ? x : y;
    }
}

contract LibraryTest {
    function test(int256 x, int256 y) public pure returns (int256) {
        return MathTest.math(x, y);
    }
}

pragma solidity ^0.8.18;

library ArrayLib {
    function find(uint256[] storage _arr, uint256 _value)
        internal
        view
        returns (uint256)
    {
        for (uint256 index = 0; index < _arr.length; index++) {
            if (_arr[index] == _value) {
                return index;
            }
        }
        revert("Not Found");
    }
}

contract Test {
    uint256[] public arr = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

    // 会成功
    function test1() external view returns (uint256) {
        return ArrayLib.find(arr, 15);
    }

    // 会失败
    function test2() external view returns (uint256) {
        return ArrayLib.find(arr, 99);
    }
}
