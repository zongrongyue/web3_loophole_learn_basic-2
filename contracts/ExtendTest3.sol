// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    string internal name;
    //string internal test3;
    event log();
    modifier onlyOwner() {
        _;
    }

    function test() internal virtual {}

    function test2() internal {}

    function test4() internal virtual {}
}

contract B {
    string internal name1;
    event log1();
    modifier onlyOwner1() {
        _;
    }

    function test() internal virtual {}

    function test3() internal {}
}

contract C is A, B {
    function test() internal override(A, B) {}

   // function test4() internal override {}
}
