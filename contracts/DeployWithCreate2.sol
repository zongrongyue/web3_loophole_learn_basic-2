// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DeployWithCreate2 {
    address public deployer;
    address public owner;

    constructor(address _owner) payable {
        owner = _owner;
        deployer = msg.sender;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

contract AccountFactory {
    DeployWithCreate2[] public accounts;

    function deploy(uint256 _salt) external payable {
        DeployWithCreate2 account = new DeployWithCreate2{
            salt: bytes32(_salt), // uint256 需要转为 bytes32
            value: msg.value
        }(msg.sender);
        accounts.push(account);
    }

    // 获取即将部署的地址
    function getAddress(bytes memory bytecode, uint256 _salt)
        external
        view
        returns (address)
    {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff), // 固定字符串
                address(this), // 当前工厂合约地址
                _salt, // salt
                keccak256(bytecode) //部署合约的 bytecode
            )
        );
        return address(uint160(uint256(hash)));
    }

    // 获取合约的 bytecode
    function getBytecode(address _owner) external pure returns (bytes memory) {
        bytes memory bytecode = type(DeployWithCreate2).creationCode;
        // 连接的参数使用 abi.encode
        return abi.encodePacked(bytecode, abi.encode(_owner));
    }
}