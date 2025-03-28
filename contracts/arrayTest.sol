// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ArrayTest {
    //静态数组
    uint256[6] a;
    string[2] b;
    uint256[] public T1 = [1, 2, 3, 4, 5]; // 方式 1

    //数组常量的类型
    //  int8[2] public g = [1, -1];
    // int8[2] public g = [int8(1), -1];

    //a[0] = 1;
    //a[1] = 1;

    // b[0] = "qq";
    // b[1] = "aa";

    //动态数组
    uint256[] c;
    string[] d;

uint256[] public a1 = new uint256[](5);

    function setStorageA() external {
        a1.push(8);
    }

    function setMemoryA() external pure {
      // uint256[] memory a2 = new uint256[](5);

        // Type uint8[5] memory is not implicitly convertible to expected
        // type uint256[] memory. uint256[] memory a3 = [1, 2, 3, 4, 5];

        // Member "push" is not available in uint256[] memory outside of storage.
        // a2.push(8);
    }



    function test() public {
        a[0] = 1;
        a[1] = 10;
        a[2] = 100;
    }

    function pushTest1() public {
        c.push(22);
    }

    function pushTest2() public {
        c.push(33);
    }

    function popTest2() public {
        c.pop();
    }

    function deleteTest2() public {
        delete c[0];
        delete c[1];
    }

    function funcArray() public pure returns (uint256[] memory) {
        uint256[] memory arr1 = new uint256[](10);
        arr1[0] = 22;
        arr1[5] = 11;
        return arr1;
    }

    function get() public view returns (uint256[] memory, uint256) {
        return (c, a.length);
    }

    function getLthgth() public view returns (uint256, uint256) {
        return (c.length, a1.length);
    }

    function manipulateArray() public pure returns (uint256[] memory) {
        uint256[] memory tempArray = new uint256[](3); // 内存中创建长度为3的动态数组
        tempArray[0] = 10;
        return tempArray;
    }
}
