package com.ruoyi.book.domain.VO;

import lombok.Data;

@Data
public class SaveScore {

    private  Integer bookId;
    private  Long userId;
    private  String data;
    private  Double score;
}
