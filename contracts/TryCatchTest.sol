// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TryCatchDemo {
    // function count() public pure returns (int256) {
    //     require(1 == 2, "require error");
    //     return 2;
    // }

    function count() public pure returns (int256) {
        assert(1 == 2);
        return 2;
    }

    function test() public view returns (string memory) {
        try this.count() {
            //成功执行
            return "success";
        } catch Error(string memory reason) {
            // reason 是出错原因
            // 调用 count() 失败时执行，通常是不满足 require 语句条件
            // 或触发 revert 语句时所引起的调用失败
            return reason;
        } catch (bytes memory){
            return "assert error";
        }
    }
}
