// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    function f() external view virtual returns (uint256) {
        return 5;
    }
}

contract B is A {
    uint256 public override f;
}
