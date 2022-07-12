package com.ruoyi.web.controller.recommend;



import com.ruoyi.book.domain.Book;
import com.ruoyi.book.domain.NewBook;
import com.ruoyi.book.domain.VO.SaveScore;
import com.ruoyi.book.mapper.FunctionMapper;
import com.ruoyi.web.controller.common.service.FunctionService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.framework.web.service.PermissionService;
import com.ruoyi.framework.web.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RestController
@RequestMapping("/tv/recommend")
public class FunctionController {

    @Autowired
    private FunctionService functionService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private FunctionMapper functionMapper;


    //2022年推荐榜单 展示
    @GetMapping("ListRecommend")
    public List<Book>  getListRecommend(){
        return  functionService.getListRecommend();
    }

    //新书上架  模糊搜索
    @PostMapping("ListBookName")
    public  AjaxResult  getListBookName(NewBook newBook){

        return AjaxResult.success(functionService.getListBookName(newBook));
    }
    //添加取消收藏
    @PutMapping("saveCollect" )
    public AjaxResult  saveCollect(@RequestBody  NewBook newBook){
        System.out.println(newBook.getFavorite());
        System.out.println(newBook.getId());
        return  AjaxResult.success(functionService.saveCollect(newBook));

    }
    //新品上架
    @GetMapping("getListNweBook")
    public  AjaxResult   getListNweBook(@RequestParam(value = "favorite",required = false) Integer favorite){

        System.out.println("接受到了收藏的参数：" + favorite);
        return  AjaxResult.success(functionService.getListNweBook(favorite));


    }




    //添加评分
    //    VALUES (#{bookId}, #{userId}, now(), #{score});

    @PutMapping(value = "saveScore")
    public AjaxResult saveScore(@RequestBody SaveScore saveScore){
            saveScore.setUserId( functionMapper.getUserId());

        return AjaxResult.success(functionService.saveScore(saveScore));
    }




    //添加书籍
//    private  Integer   id;
//    private  String   title; 书籍名称
//    private  String   titleUrl; 书籍地址
//    private  String   name;  作者
//    private  String   images;  图片地址
//    private  String   message;  字数
//    private  Integer  favorite;

    //添加书籍
    @PostMapping("addNewBook")
    public AjaxResult  addNewBook(@RequestBody  NewBook newBook){
        System.out.println("tupian" + newBook.getImages());
        int a = (int)(Math.random() * (999999 - 100000 + 1) + 100000);
        newBook.setId(a);

        return AjaxResult.success(functionService.addNewBook(newBook));
    }
    //新书推荐
    @GetMapping("NewBookRecommend")
    public List<NewBook>  ListNewBookRecommend(){
        return  functionService.ListNewBookRecommend();
    }


    /**
     * 管理员删除书籍
     */
    @DeleteMapping("deleteAdminBook/{id}")
        public  AjaxResult deleteBook(@PathVariable Integer id){

        return AjaxResult.success(functionService.deleteBook(id));
    }
    /**
     * 管理员界面遍历数据
     */
    @GetMapping("getAdminBook")
    public  AjaxResult getAdminBook(){
        return  AjaxResult.success(functionService.getAdminBook());
    }


}
