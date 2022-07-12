package com.ruoyi.book.domain;

import lombok.Data;

@Data
public class AddBook {

    private  Integer id;
    private  String title;
    private  String images;
    private  String titleUrl;
    private  String data;
    private  Double score;
}
