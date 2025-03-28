// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    event Log(string msg);

    function test1() public virtual {
        emit Log("A.test1");
    }
}

contract B is A {
    function test1() public virtual override {
        emit Log("B.test1");
        super.test1();
    }
}

contract C is A {
    function test1() public virtual override {
        emit Log("C.test1");
        super.test1();
    }
}

contract D is B, C {
    function test1() public override(C, B) {
        emit Log("D.test1");
        // 因为 B 和 C 都是 D 的父级，所以B和C都会执行
        //super.test1();
        // B.test1();
        C.test1();
        //A.test1();
    }
}
