// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TimeTest1 {
    uint256 public time1;
    uint256 public time2 = 1 minutes;

    constructor() {
        time1 = 60;
    }
}
