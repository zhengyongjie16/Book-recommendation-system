package org.conan.getHadoop;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.LocatedFileStatus;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.RemoteIterator;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
public class HdfsUtil {

    public static void main(String[] args) {

        String ditPath = "E:\\code\\code\\大数据\\Book-recommendation-system-master\\zheng-hadoop-template\\logfile";
        final HdfsUtil hdfs = new HdfsUtil("root");
        hdfs.download("/user/hdfs/recommend",ditPath);
        System.out.println("文件已经下载到: \n" + ditPath +"\n "+ "目录下");

    }

    private FileSystem fs;
    HdfsUtil(String user){
        Configuration cfg = new Configuration();
        URI uri = null;
        try {
            uri = new URI("hdfs://hadoop1:9000");
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        try {
            // 根据配置文件，实例化成DistributedFileSystem
            fs = FileSystem.get(uri, cfg, user); // 得到fs句柄
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    /**
     * 上传文件
     */
    public void upload(String src, String dst){
        try {
            // 上传
            fs.copyFromLocalFile(new Path(src), new Path(dst));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 下载文件
     */
    public void download(String src, String dst){
        try {
            // 下载
            fs.copyToLocalFile(new Path(src), new Path(dst));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 创建文件夹
     */
    public void mkdir(String dir){
        try {
            fs.mkdirs(new Path(dir));
        } catch (IOException e) {
            // 创建目录
            e.printStackTrace();
        }
    }
    /**
     * 删除文件
     */
    public void delete(String name, boolean recursive){
        try {
            fs.delete(new Path(name), recursive);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 重命名
     */
    public void rename(String source, String dst){
        try {
            fs.rename(new Path(source), new Path(dst));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
