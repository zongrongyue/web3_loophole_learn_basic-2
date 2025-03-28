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

// 这里必须是 contract C is A, B
// 不能使用 contract C is B, A
contract C is A, B {
    function test1() public pure override(A, B) returns (string memory) {
        return "test1 from C";
    }

    // overrid内参数顺序无所谓，
    // C 内必须重写 A 和 B，否则会报错
    function test2() public pure override(B, A) returns (string memory) {
        return "test1 from C";
    }
}
