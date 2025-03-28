// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StringTest {
    string public str = "welcome";

    string public hello = "Hello Anbang";
    bytes public temp1 = abi.encodePacked(hello);
    bytes public temp2 = abi.encode(hello);

    bytes public temp3 = abi.encodeWithSignature(hello);
    bytes public temp4 = abi.encodeWithSignature("Hello Anbang1");

    function getLength() public view returns (uint256) {
        return bytes(str).length;
    }

    function getIndexValue(uint256 index) public view returns (string memory) {
        bytes memory by = bytes(str);
        bytes1 temp8 = by[index];
        bytes memory temp9 = new bytes(1);
        temp9[0] = temp8;
        return string(temp9);
    }

    function mdi() public {
        bytes(str)[0] = bytes1("2");
    }

    // concat
    function concatStr(string memory name)
        public
        view
        returns (string memory concatString)
    {
        bytes memory bs = bytes("!");
        concatString = string.concat(str, name, string(bs));
    }

    function test3(string memory hello_) public view returns (bool) {
        return keccak256(bytes(str)) == keccak256(bytes(hello_));
    }
}
