package com.efeiyi.association.core;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by Administrator on 2015/9/22.
 * 保存多个数据源
 */
public class DatabaseContextHolder {
    //    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();
//    private static final ThreadLocal<ReentrantLock> dataSourceLockHolder = new ThreadLocal<ReentrantLock>();
//    private static final ThreadLocal<Map<HttpServletRequest, String>> requestBinded2Thread = new ThreadLocal<Map<HttpServletRequest, String>>();
    private static final Map<Thread,HttpServletRequest> threadBinded2Request = new HashMap<Thread,HttpServletRequest>();
    private static final Map<HttpServletRequest,String> requestBinded2Datasource = new HashMap<HttpServletRequest,String>();


    public static void setDataSource(HttpServletRequest request, String dataSource) {
        requestBinded2Datasource.put(request,dataSource);
        threadBinded2Request.put(Thread.currentThread(), request);
    }

    public static String getDataSource() {
        return requestBinded2Datasource.remove(threadBinded2Request.remove(Thread.currentThread()));
    }

//    public static String getDataSource() {
//        Map<HttpServletRequest, String> map = null;
//        if ((map = requestBinded2Thread.get()) == null || map.isEmpty()) {
//            return null;
//        }
//        for (Map.Entry<HttpServletRequest, String> entry : map.entrySet()) {
//            return entry.getValue();
//        }
//        return null;
//    }

//    public static void setDataSource(String dataSource) {
//        contextHolder.set(dataSource);
//    }

//    public static String getDataSource() {
//        return contextHolder.get();
//    }

    public static void clearDataSource(HttpServletRequest request) {
        requestBinded2Datasource.remove(request);
        threadBinded2Request.remove(Thread.currentThread());
    }

//    public static Lock getDataSourceLock(HttpServletRequest request){
//        if(dataSourceLockHolder.get() == null) {
//            synchronized (request) {
//                if(dataSourceLockHolder.get() == null) {
//                    dataSourceLockHolder.set(new ReentrantLock());
//                }
//            }
//        }
//        return dataSourceLockHolder.get();
//    }

}
