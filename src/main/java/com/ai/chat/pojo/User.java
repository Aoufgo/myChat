package com.ai.chat.pojo;


public class User {
    private String id;
    private String name;
    private String nickname;
    private String password;
    private String sex;
    private int age;
    private String phone;
    private int status;
    private int accStatus;
    private String createTime;
    private String lastLoginTime;
    private String faceUrl;
    private String facePath;
    private String avatarUrl;

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                ", accStatus=" + accStatus +
                ", createTime='" + createTime + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", faceUrl='" + faceUrl + '\'' +
                ", facePath='" + facePath + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccStatus() {
        return accStatus;
    }

    public void setAccStatus(int accStatus) {
        this.accStatus = accStatus;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getFaceUrl() {
        return faceUrl;
    }

    public void setFaceUrl(String faceUrl) {
        this.faceUrl = faceUrl;
    }

    public String getFacePath() {
        return facePath;
    }

    public void setFacePath(String facePath) {
        this.facePath = facePath;
    }

    public User(String id, String name, String nickname, String password, String sex, int age, String phone, int status, int accStatus, String createTime, String lastLoginTime, String faceUrl, String facePath) {
        this.id = id;
        this.name = name;
        this.nickname = nickname;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
        this.status = status;
        this.accStatus = accStatus;
        this.createTime = createTime;
        this.lastLoginTime = lastLoginTime;
        this.faceUrl = faceUrl;
        this.facePath = facePath;
    }
}
