// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MappingTest {
    // 普通
    mapping(address => uint256) public balances;
    // 嵌套
    mapping(address => mapping(address => bool)) public friends;

    //在构造器中初始化
    constructor() {
        balances[msg.sender] = 100;
    }

    //获取
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    //设置
    function setBalance(uint256 amount) public {
        balances[msg.sender] = amount;
    }

    //删除
    function deleteBalance() public {
        delete balances[msg.sender];
    }

    //获取
    function getFriend() public view returns (bool) {
        return friends[msg.sender][address(0)];
    }

    //设置
    function setFriend() public{
        friends[msg.sender][address(0)] = true;
    }

    //删除
    function deleteFriend() public {
        delete friends[msg.sender][address(0)];
        // delete friends[msg.sender];
    }
}
