package com.ruoyi.web.controller.common.service.impl;


import com.ruoyi.book.domain.AddBook;
import com.ruoyi.book.domain.Book;
import com.ruoyi.book.domain.NewBook;
import com.ruoyi.book.domain.VO.SaveScore;
import com.ruoyi.book.mapper.FunctionMapper;
import com.ruoyi.web.controller.common.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FunctionServiceImpl implements FunctionService {

    @Autowired
    private FunctionMapper functionMapper;

    @Override
    public List<Book> getListRecommend() {
        return functionMapper.getListRecommend();
    }

    @Override
    public List<NewBook> getListBookName(NewBook newBook) {
        return functionMapper.getListBookName(newBook);
    }


    @Override
    public int savedBook(AddBook addBook) {


        //随机id
       Integer  number = (int)(Math.random()*1000000)+10000;

         addBook.setId(number);
         addBook.setImages(addBook.getImages());
        return functionMapper.savedBook(addBook);
    }

    @Override
    public  List<NewBook> ListNewBookRecommend() {
        return functionMapper.ListNewBookRecommend();
    }

    @Override
    public int saveCollect(NewBook newBook) {
        return functionMapper.saveCollect(newBook);
    }

    @Override
    public int saveScore(SaveScore saveScore) {

        return functionMapper.saveScore(saveScore);
    }

    @Override
    public List<NewBook> getListNweBook(Integer favorite) {

        return functionMapper.getListNweBook(favorite);
    }

    @Override
    public int addNewBook(NewBook newBook) {
        return functionMapper.addNewBook(newBook);
    }

    @Override
    public int deleteBook(Integer id) {
        return functionMapper.deleteBook(id);
    }

    @Override
    public List<NewBook> getAdminBook() {
        return functionMapper.getAdminBook();
    }
}
