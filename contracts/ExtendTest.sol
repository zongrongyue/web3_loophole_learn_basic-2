// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    function test1() public pure virtual returns (string memory) {
        return "test1 from A";
    }

    function test2() external pure virtual returns (string memory) {
        return "test2 from A";
    }

    function test3() public pure virtual returns (string memory) {
        return "test3from A";
    }
}

contract B is A {
    function test1() public pure virtual override returns (string memory) {
        return "test1 from B";
    }

    function test2() external pure override returns (string memory) {
        return "test2 from B";
    }
}

contract C is B {
    function test1() public pure override returns (string memory) {
        return "test1 from C";
    }
}

contract Base1 {
    function foo() public virtual {}
}

contract Base2 {
    function foo() public virtual {}
}

contract Inherited is Base1, Base2 {
    function foo() public override(Base1, Base2) {}
}
