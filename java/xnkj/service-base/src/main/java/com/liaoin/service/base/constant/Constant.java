package com.liaoin.service.base.constant;

public interface Constant {

    /**
     * 分页条数
     */
    public interface PageConstant{
        int PAGE_COUNT = 10;
        int ADMIN_PAGE_COUNT = 10;
    }

    /**
     * 权限认证参数
     */
    public interface AUTHENTICATION{
        /**
         * 存储当前登录用户id的字段名
         */
        public static final String CURRENT_USER_ID = "CURRENT_USER_ID";

        /**
         * 存放Authorization的header字段
         */
        public static final String AUTHORIZATION = "authorization";
    }

    /**
     * 文件路径
     */
    public interface PATH{
        public static String FILE_UPLOAD_PATH = "/upload";
    }

}
