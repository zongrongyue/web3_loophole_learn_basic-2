// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SelecttorTest {
    // 存放函数选择器
    bytes4 storeSelector;

    //2倍方法
    function double(uint256 a) public pure returns (uint256) {
        return 2 * a;
    }

    //平方方法
    function square(uint256 a) public pure returns (uint256) {
        return a * a;
    }

    // 获取方法选择器
    function getSelector()public returns (bytes4){
        //调用select方法，返回bytes4类型变量storeSelector
       //bytes4 doubleSelector = this.double.selector;
       bytes4 squareeSelector = bytes4(keccak256("square(uint256)"));
       storeSelector = squareeSelector;
        return  storeSelector;
    }

    //根据函数选择器动态执行不同方法

    function execute(bytes4 selector, uint x) public  returns (uint z){
        (bool success,bytes memory data)=address(this).call(abi.encodeWithSelector(selector, x));
        require(success,"success");
        z = abi.decode(data, (uint));
    }
}
