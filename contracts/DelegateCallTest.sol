// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DelegateCallTest {
    function set(address _ads, uint256 _num) external payable {
        address sender = msg.sender;
        uint256 value = msg.value;
        uint256 num = _num;
        // 第1种 encode
        // 不需知道合约名字，函数完全自定义
        bytes memory data1 = abi.encodeWithSignature("set(uint256)", _num);
        // 第2种 encode
        // 需要合约名字，可以避免函数和参数写错
        // bytes memory data2 = abi.encodeWithSelector(Test1.set.selector, _num);

        (bool success, bytes memory _data) = _ads.delegatecall(data1);

        require(success, "DelegateCall set failed");
    }
}
