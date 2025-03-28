// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BytesTest {
    //创建方式
    bytes public welcome = bytes("welcome");
    bytes public temp1 = new bytes(3);
    bytes public temp3 = bytes("B");

    function test1(uint256 len) public pure returns (bytes memory) {
        bytes memory temp2 = new bytes(len);
        temp2[0] = "a";
        return temp2;
    }

    function getLthgth() public view returns (uint256, uint256) {
        return (temp1.length, 1);
    }

    function test2() public {
        temp1[0] = "a";
        temp1[1] = "b";
        temp1[2] = "c";
        //temp1[3] = "d";
    }

    bytes1[] public abcArray = [bytes1("a"), bytes1("b"), bytes1("c")];

    // 0x616263
    bytes public abcBytes = bytes("abc");

    function getAbcArr() external view returns (bytes1[] memory) {
        return abcArray;
    }

    function getLength() public view returns (uint256 welcomeLength) {
        welcomeLength = welcome.length;
    }

    //0x77656c636f6d65
    function modi() public {
        welcome[0] = bytes1("2");
    }

    bytes public concatBytes =
        bytes.concat(welcome, bytes("b"), bytes1("c"), "a");

    function testPush() public {
        welcome.push(bytes("B")[0]);
        // welcome2.push(bytes("B")[0]);
    }

    function deleteAll() public {
        delete welcome;
    }

    function deleteIndex(uint256 index_) public {
        delete welcome[index_];
    }

    // 把 welcome1 的值传入参数
    function forward(bytes calldata payload)
        external
        pure
        returns (bytes memory temp4, bytes4 temp5)
    {
        // 切片方法只能用在 calldata 上。
        temp4 = payload[:4];
        temp5 = bytes4(payload[:4]);
    }
}
