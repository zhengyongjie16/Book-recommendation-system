package com.ruoyi.web.controller.common.service;



import com.ruoyi.book.domain.AddBook;
import com.ruoyi.book.domain.Book;
import com.ruoyi.book.domain.NewBook;
import com.ruoyi.book.domain.VO.CollectBook;
import com.ruoyi.book.domain.VO.SaveScore;

import java.util.List;

public interface FunctionService {

    List<Book> getListRecommend();

    List<NewBook> getListBookName(NewBook newBook);

    int savedBook(AddBook addBook);

    List<NewBook> ListNewBookRecommend();

    int saveCollect(NewBook newBook);

    int saveScore(SaveScore saveScore);

    List<NewBook> getListNweBook(Integer favorite);

    int addNewBook(NewBook newBook);

    int deleteBook(Integer id);

    List<NewBook> getAdminBook();
}
