// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    event logA(string);

    constructor(string memory _name) {
        emit logA(_name);
    }
}

contract B {
    event logB(string);

    constructor(string memory _name) {
        emit logB(_name);
    }
}

//  混合使用
contract E is A, B("EEE") {
    constructor(string memory _name) A(_name) {}
}

contract F is B("FFF"), A {
    constructor(string memory _name) A(_name) {}
}