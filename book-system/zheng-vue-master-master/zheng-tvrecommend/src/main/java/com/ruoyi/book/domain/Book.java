package com.ruoyi.book.domain;

import lombok.Data;

@Data
public class Book {
    private Integer bookId;
    private  Integer userId;
    private  Double score;
    private  String title;
    private  String titleUrl;
    private  String images;
    private Integer collect;
}
