# Hadoop-Book-recommendation-system

#### 介绍
基于Hadoop图书推荐系统

#### 软件架构
软件架构
Hadoop框架  SpringBoot框架  vue框架

大数据代码分析

数据集解析
    每行3个字段，依次是用户ID,商品ID,用户对商品的评分(0-5分，每0.5为一个评分点！)

推荐算法分类：
按数据使用划分：
     协同过滤算法：UserCF, ItemCF, ModelCF
    基于内容的推荐: 用户内容属性和物品内容属性
    社会化过滤：基于用户的社会网络关系
按模型划分：
    最近邻模型:基于距离的协同过滤算法
    Latent Factor Mode(SVD)：基于矩阵分解的模型
    Graph：图模型，社会网络图模型
基于用户的协同过滤算法UserCF
    基于用户的协同过滤，通过不同用户对物品的评分来评测用户之间的相似性，基于用户之间的相似性做出推荐。简单来讲就是：给用户推荐和他兴趣相似的其他用户喜欢的物品。
基于物品的协同过滤算法ItemCF
基于item的协同过滤，通过用户对不同item的评分来评测item之间的相似性，基于item之间的相似性做出推荐。简单来讲就是：给用户推荐和他之前喜欢的物品相似的物品。


hadoop模块介绍
    Recommend.java，主任务启动程序
    Step1.java，按用户分组，计算所有物品出现的组合列表，得到用户对物品的评分矩阵
    Step2.java，对物品组合列表进行计数，建立物品的同现矩阵
    Step2.java，对物品组合列表进行计数，建立物品的同现矩阵
    Step3.java，合并同现矩阵和评分矩阵
    Step4.java，计算推荐结果列表
    HdfsDAO.java，HDFS操作工具类
这样我们就自己编程实现了MapReduce化基于物品的协同过滤算法。



接口实现

1、 //2020年推荐榜单 展示
 http://localhost:8080/api/ListRecommend
List 数据 {"bookId":131490,"userId":null,"score":3.7,"title":"空间的敦煌：走近莫高窟","titleUrl":"https://book.douban.com/subject/35694442/","images":"https://img9.doubanio.com/view/subject/s/public/s34079984.jpg"}

2 、、 添加书籍
请求：Post
url: http://localhost:8080/api/savedBook

{
"title":"黑道",     //书籍名
"titleUrl":"",     //书籍地址
"images":"http://images",  //书籍图片
}


//新书推荐
请求 Get
http://localhost:8080/api/NewBookRecommend
{
"id": 108407,
"title": "中世纪之美",
"titleUrl": "https://book.douban.com/subject/35431246/",
"images": "https://img9.doubanio.com/view/subject/s/public/s33927714.jpg",
"favorite": 0,
"score": null
}

