// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Test {
    function fn1()
        external
        view
        returns (
            uint256,
            address,
            uint256
        )
    {
        return (1, msg.sender, block.timestamp);
    }

    function fn2()
        external
        view
        returns (
            uint256,
            address,
            uint256
        )
    {
        return (2, msg.sender, block.timestamp);
    }

    function getFn1Data() external pure returns (bytes memory) {
        // 两种签名方法都可以
        // abi.encodeWithSignature("fn1()");
        return abi.encodeWithSelector(this.fn1.selector);
    }

    function getFn2Data() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.fn2.selector);
    }
}

contract MultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "targets.length != data.length");
        bytes[] memory results = new bytes[](data.length);
        for (uint256 index = 0; index < targets.length; index++) {
            (bool success, bytes memory result) = targets[index].staticcall(
                data[index]
            );
            require(success, "call faild");
            results[index] = result;
        }
        return results;
    }
}
