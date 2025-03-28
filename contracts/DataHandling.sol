// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DataHandlingTest {
    //动态数组 data
    uint256[] public data;

    //函数 updateData(uint[] memory newData)，该函数接收一个 memory 数组并将其内容复制到 data 中
    function updateData(uint256[] memory newdata) public {
        data = newdata;
    }

    //函数 getData() 返回 data 数组
    function getData() public view returns (uint256[] memory) {
        return data;
    }

    //modifyStorageData(uint index, uint value)：修改 data 数组中指定索引位置的值
    function modifyStroageData(uint256 index, uint256 value) public {
        data[index] = value;
    }

    //modifyMemoryData(uint[] memory memData)：尝试修改传入的 memory 数组，并返回修改后的数组
    function modifyMemoryData(uint256[] memory memData)
        public
        pure
        returns (uint256[] memory)
    {
        memData[0] = 1;
        return memData;
    }
}
