package com.ruoyi.book.domain;

import lombok.Data;

@Data
public class NewBook {

    private  Integer   id;
    private  String   title;
    private  String   titleUrl;
    private  String   name;
    private  String   images;
    private  String   message;
    private  Integer  favorite;
    private  Double   score;

}
