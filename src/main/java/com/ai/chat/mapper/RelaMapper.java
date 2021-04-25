package com.ai.chat.mapper;

import org.springframework.stereotype.Repository;

/**
 * @author aoufgo
 * @date 2021/4/25 下午5:06
 */
@Repository
public interface RelaMapper {
    /**
     * 添加好友关系
     * @param id1 id1
     * @param id2 id2
     * @return 影响行数
     */
    int addF(String id1,String id2);
}
