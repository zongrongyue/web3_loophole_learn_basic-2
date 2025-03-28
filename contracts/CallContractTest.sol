// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CallContarctTest {
    uint256 public x = 1;
    uint256 public y = 2;

    function setX(uint256 _x) public {
        x = _x;
    }

    function getX() public view returns (uint256) {
        return x;
    }

    function setYBySendEth() public payable {
        y = msg.value;
    }

    function getXandY() public view returns (uint256, uint256) {
        return (x, y);
    }
}

contract CallTest {
    // 第1种方法:
    function setX1(address addr, uint256 y) public {
        CallContarctTest callContarctTest = CallContarctTest(addr);
        callContarctTest.setX(y);
    }

    //第二张方式
    function setX2(CallContarctTest callContarctTest, uint256 y) public {
        callContarctTest.setX(y);
    }

    function getX(address addr) public view returns (uint256) {
        return (CallContarctTest(addr)).getX();
    }

    function setYBySendEth(address addr) public payable {
        (CallContarctTest(addr)).setYBySendEth{value: msg.value};
    }

    function getXandY(address addr) public view returns (uint256 x, uint256 y) {
        (x, y) = (CallContarctTest(addr)).getXandY();
    }
}

interface AnimalEat {
    function eat() external returns (string memory);
}

contract Animal {
    function test(address addr) public returns (string memory) {
        AnimalEat animalEat = AnimalEat(addr);
        return animalEat.eat();
    }
}
