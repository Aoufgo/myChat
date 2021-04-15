package com.ai.chat.pojo;

import java.io.Serializable;

/**
 * @author aoufgo
 * @date 2021/4/14 下午4:39
 */
public class Relation implements Serializable {
    private String id1;
    private String id2;
    private String group;

    @Override
    public String toString() {
        return "Relation{" +
                "id1='" + id1 + '\'' +
                ", id2='" + id2 + '\'' +
                ", group='" + group + '\'' +
                ", user=" + user +
                '}';
    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Relation() {
    }

    public String getId1() {
        return id1;
    }

    public void setId1(String id1) {
        this.id1 = id1;
    }

    public String getId2() {
        return id2;
    }

    public void setId2(String id2) {
        this.id2 = id2;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Relation(String id1, String id2, String group) {
        this.id1 = id1;
        this.id2 = id2;
        this.group = group;
    }
}
