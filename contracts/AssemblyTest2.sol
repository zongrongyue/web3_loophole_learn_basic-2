// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AssemblyTest2 {
    function demoAssembly() public pure returns (uint256 y) {
        uint256 x = 0;
        assembly {
            if iszero(x) {
                y := add(1, x)
            }
        }
    }

    function demoAssembly2(uint256 x) public pure returns (uint256 result) {
        assembly {
            switch x
            case 0 {
                result := 1
            }
            case 1 {
                result := 2
            }
            default {
                result := mul(x, x)
            }
        }
    }

    function demoAssembly3() public pure returns (uint256, uint256) {
        assembly {
            let x := 1
            let y
            y := 3

            mstore(0x0, x)
            mstore(add(0x0, 32), y)
            return(0x0, 64)
        }
    }

    function demoAssembly4() public pure returns (uint256 result) {
        uint256 length = 4;
        assembly {
            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 1)
            } {
                result := add(i,1)
            }

            mstore(0x0, result)
            return(0x0, 32)
        }
    }
}
