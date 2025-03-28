// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MultiDelegatecall {
    function multiDelegatecall(bytes[] calldata data)
        external
        returns (bytes[] memory)
    {
        bytes[] memory results = new bytes[](data.length);
        for (uint256 index = 0; index < data.length; index++) {
            (bool success, bytes memory result) = address(this).delegatecall(
                data[index]
            );
            require(success, "call faild");
            results[index] = result;
        }
        return results;
    }
}

contract Test is MultiDelegatecall {
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