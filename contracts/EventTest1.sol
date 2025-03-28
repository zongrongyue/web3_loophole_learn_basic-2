// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EventTest1 {
    // 不带参数的event
    event log0();
    // 带参数的event
    event log1(address, string);
    // 带参数的名字event
    event log2(address addr, string str);
    // 带indexed的event
    event log3(address indexed addr, string str);

    // indexed 在一个事件内使用次数不能超过3次
    event transfer(
        address indexed from,
        address indexed to,
        uint256 indexed amount
    );

    function exeLog0() public {
        emit log0();
    }

    function exeLog1() public {
        emit log1(msg.sender, "log111");
    }

    function exeLog2() public {
        emit log2(msg.sender, "log222");
    }

    function exeLog3() public {
        emit log3(msg.sender, "log333");
    }

    function exeTransfer(address _to, uint256 amount) public {
        emit transfer(msg.sender, _to, amount);
    }
}
