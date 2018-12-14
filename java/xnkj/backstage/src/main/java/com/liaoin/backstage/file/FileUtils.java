package com.liaoin.backstage.file;

import com.liaoin.common.date.DateFormat;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.constant.Constant;
import com.liaoin.service.base.message.OperateResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;


@Slf4j
public class FileUtils {

    /**
     * 文件上传
     */
    public static OperateResult upload(MultipartFile file, HttpServletRequest request) throws Exception {
        if (file.isEmpty()) {
            return fail(Result.FILE_NOT_NULL);
        }
        String fileName = System.currentTimeMillis() + "." + getFileType(file);
        int size = (int) file.getSize();
        String filePath = Constant.PATH.FILE_UPLOAD_PATH + "/" + nowDate() + "/";
        File dest = new File(rootPath() + filePath + "/" + fileName);
        if (!dest.getParentFile().exists()) { //判断文件父目录是否存在
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest); //保存文件
            Map<String, String> map = new HashMap<String, String>();
            map.put("picture", FileUtils.http(request) + filePath + fileName);
            map.put("size", size + "");
            map.put("name", getFileName(file));
            map.put("fileType", getFileType(file));
            map.put("ext", "1");
            return success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return fail(Result.FAIL);
        }
    }







    /**
     * 获取上传文件类型
     */
    public static String getFileType(MultipartFile file) {
        String[] s = file.getOriginalFilename().split("\\.");
        List list = new ArrayList();
        for (String s1 : s) {
            list.add(s1);
        }
        if (list.size() > 1) {
            return list.get(list.size() - 1).toString();
        }
        return null;
    }

    /**
     * 获取文件名称
     */
    public static String getFileName(MultipartFile file) {
        String filename = file.getOriginalFilename().replace("." + getFileType(file), "");
        return filename;
    }

    /**
     * 获取当前系统日期
     */
    public static String nowDate() {
        return DateFormat.stampToDateEndD(System.currentTimeMillis() + "");
    }

    /**
     * 获取请求http
     *
     * @param request
     * @return
     */
    public static String http(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    }

    /**
     * 获取项目根路径
     */
    public static String rootPath() throws Exception {
        File directory = new File("");// 参数为空
        String rootPath = directory.getCanonicalPath();
        return rootPath;
    }

}
