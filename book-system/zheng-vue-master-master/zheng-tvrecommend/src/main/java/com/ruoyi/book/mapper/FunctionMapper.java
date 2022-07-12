package com.ruoyi.book.mapper;


import com.ruoyi.book.domain.AddBook;
import com.ruoyi.book.domain.Book;
import com.ruoyi.book.domain.NewBook;
import com.ruoyi.book.domain.VO.CollectBook;
import com.ruoyi.book.domain.VO.SaveScore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FunctionMapper {
    List<Book> getListRecommend();

    List<NewBook> getListBookName(NewBook newBook);

    int savedBook(AddBook addBook);

    List<NewBook> ListNewBookRecommend();

    int saveCollect(NewBook newBook);

    int saveScore(SaveScore saveScore);

    List<NewBook> getListNweBook(Integer favorite);

    int addNewBook(NewBook newBook);

    void upUserId(Long userId);

    Long getUserId();

    int deleteBook(Integer id);

    List<NewBook> getAdminBook();

}
