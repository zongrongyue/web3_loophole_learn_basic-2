// SPDX-License-Identifier: MIT
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
    // using for 可以让所有 uint256[] 数据，都具有 ArrayLib 内的方法
    using  ArrayLib for uint256[];

    uint256[] public arr = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

    function test1() external view returns (uint256) {
        // return ArrayLib.find(arr, 15);

        // 可以直接使用 arr.find，而不需要额外修改 ArrayLib 内的代码
        return arr.find(12);
    }

    function test2() external view returns (uint256) {
        // return ArrayLib.find(arr, 99);
        return arr.find(99);
    }
}