// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorModifier{
     address public owner;
     uint public count = 0;

     constructor(){
         owner = msg.sender;
     }

    // 下面就是函数修改器
     modifier onlyOwner(){
         require(msg.sender==owner,"must owner address");
         _;
     }
     function add() external onlyOwner{
         count++;
     }
     function minus() external onlyOwner{
         count--;
     }

}