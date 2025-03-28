// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    function test1() public pure virtual returns (string memory) {
        return "test1 from A";
    }

    // 使用 public 和 external 都可以
    function test2() external pure virtual returns (string memory) {
        return "test2 from A";
    }

    function test3() public pure virtual returns (string memory) {
        return "test3 from A";
    }
}

contract B is A {
    function test1() public pure virtual override returns (string memory) {
        return "test1 from B";
    }

    function test2() external pure virtual override returns (string memory) {
        return "test2 from B";
    }
}

contract C is A {
    function test1() public pure virtual override returns (string memory) {
        return "test1 from C";
    }
}

contract D is C {
    function test1() public pure virtual override returns (string memory) {
        return "test1 from D";
    }
}

contract E is B, D {
    function test1() public pure override(B, D) returns (string memory) {
        return "test1 from E";
    }

    // 必须要重写 test2 ，因为此时 B 和 D 内都有test2方法，但是D内继承A的test2方法，冲突了。
    // 需要要写  override(B, A)，不能写 override(B, D)，否则会报如下错误
    // Function needs to specify overridden contract "A".
    // Invalid contract specified in override list: "D".

    // 下面是错误的写法
    // function test2() public pure override(B, D) returns (string memory) {

    // 下面是正确的写法
    function test2() public pure override(B, A) returns (string memory) {
        return "test2 from E";
    }
}
