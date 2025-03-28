// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StructTest {
    struct Book {
        string title;
        string author;
        uint256 book_id;
    }

    uint256 private bookId;
    // 书柜:数组类型
    Book[] public bookCase;

    function getBookCases() public view returns (Book[] memory) {
        return bookCase;
    }

    function setA1BookCase() public {
        // 第1种生成方法：顺序一定要和结构一致
        Book memory book1 = Book(
            unicode"Solidity 高级程序设计",
            "Anbang",
            ++bookId
        );
        bookCase.push(book1);
    }

    // ✅ 最优方案，推荐: 先写入内存，然后push
    function setB1BookCase() public {
        // 第 2 种生成
        Book memory book2 = Book({
            title: unicode"Solidity 高级程序设计",
            author: "Anbang",
            book_id: ++bookId
        });
        bookCase.push(book2);
    }

    function setB2BookCase() public {
        // 第 2 种生成: 直接 push，无变量
        bookCase.push(
            Book({
                title: unicode"Solidity 高级程序设计",
                author: "Anbang",
                book_id: ++bookId
            })
        );
    }

    function setC1BookCase() public {
        // 第 3 种生成: 推荐
        Book memory book3;
        book3.author = unicode"Solidity 高级程序设计";
        book3.title = "Anbang";
        book3.book_id = ++bookId;
        bookCase.push(book3);
    }


    Book public book = Book("Solidity", "Anbang", 1);

    function modi() external {
        book.title = "Solidity 666";
    }

    
}
