// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract ArrTest{
    uint[] public arr;
    function addElement(uint element) public  {
        arr.push(element);
    }

    function romoveLastElement() public  {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

}