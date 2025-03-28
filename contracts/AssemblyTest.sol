// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Demo {
    // 输入 1,2 ; 输出 22307 gas
    function addSolidity(uint256 _x, uint256 _y) public pure returns (uint256) {
        return (_x + _y);
    }

    // 输入 1,2 ; 输出 21915 gas
    function addAssembly(uint256 _x, uint256 _y) public pure returns (uint256) {
        assembly {
            // let result 是声明一个变量 result
            // add(_x, _y) 是计算 x + y 的结果
            // := 是将 x + y 的结果赋值给变量 result
            let result := add(_x, _y)

            // mstore(0x0, result) 在内存 `0x0` 的位置储存 `result`
            mstore(0x0, result)

            // 从内存索引 0x0 位置返回32字节
            return(0x0, 32)
        }
    }
}

contract Demo1 {
    function demoAssembly() public pure returns (uint256, uint256) {
        assembly {
            let x := 2 // 声明 x，赋值为2
            let y  // 声明 y，初始化为 0
            y := 5 // 赋值 y 为5

            mstore(0x0, x) // 内存中储存 x
            mstore(add(0x0, 32), y) // 内存中移动32位，再储存y

            // 返回内存中 0 - 64 的数据
            return(0x0, 64)
        }
    }

    //字符串字面量 最多可以包含 32 个字符
    function demoAssembly1() public pure {
        assembly {
            let a := 0x123 // 16进制
            let b := 42 // 10进制
            let c := "hello world" // 字符串
            //let d := "very long string more than 32 bytes" // 长度 35 的 字符串，错误！
        }
    }
}

contract Demo2 {
    uint256 a = 2;

    function demoAssembly() public pure {
        uint256 b = 5;
        assembly {
            // 可以读取 x 和 y
            let x := add(2, 3)
            let y := 10
            let z := add(x, y)
        }
        assembly {
            // 可以读取 x 和 b
            let x := add(2, 3)
            let y := mul(x, b)
        }
        assembly {
            let x := add(2, 3)

            // ❌ TypeError: Only local variables are supported.
            // To access storage variables, use the ".slot" and ".offset" suffixes.
           // let y := mul(x, a)  //汇编只能读取局部变量
        }
    }
}
