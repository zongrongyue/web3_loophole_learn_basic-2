// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AddressTest {
    //声明一个mapping，存放白名单
    mapping(address => bool) public whiteList;

    //声明一个mapping，存放地址余额
    mapping(address => uint256) balances;

    //把地址放入白名单
    function addWhiteList(address addr) public {
        whiteList[addr] = true;
    }

    //检查地址是否在白名单
    function checkWhiteList(address addr) public view returns (bool isIn) {
        return whiteList[addr];
    }

    //白名单地址发送交易
    function pay() public payable {
        require(whiteList[msg.sender], "address Not in the whitelist");
        payable(msg.sender).transfer(msg.value);
    }

    //存款
    function deposit() public payable {
        //合约转账转入和eth数量在msg.value中
        balances[msg.sender] += msg.value;
    }

    //提款
    function withdraw(uint256 amount) public payable {
        // 获取交易地址
        address addr = msg.sender;
        //判断交易金额是否超过账户余额
        require(balances[addr] >= amount, "insufficient balance");
        //发送交易
        //payable(addr).transfer(amount);
        // payable(addr).send(amount);
        (bool success, ) = payable(addr).call{value: amount}("");
        require(success,"Transfer failed");
        //更新余额
        balances[addr] -= amount;
    }

    //查看账户余额
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
