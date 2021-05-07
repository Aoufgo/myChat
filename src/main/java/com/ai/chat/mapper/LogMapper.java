package com.ai.chat.mapper;

import com.ai.chat.pojo.Log;

import java.util.List;

public interface LogMapper {

    /**
     * 保存日志
     * @param log
     * @return
     */
    int add (Log log);

    /**
     * 查询所有日志
     * @param log
     * @return
     */
    List<Log> queryAllLog (Log log);
}
