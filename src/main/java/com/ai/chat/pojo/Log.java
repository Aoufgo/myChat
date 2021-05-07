package com.ai.chat.pojo;

public class Log {
    private int logId;
    private int adminId;
    private String operation;
    private String status;
    private String createTime;

    @Override
    public String toString() {
        return "Log{" +
                "logId=" + logId +
                ", adminId=" + adminId +
                ", operation='" + operation + '\'' +
                ", status='" + status + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Log(int logId, int adminId, String operation, String status, String createTime) {
        this.logId = logId;
        this.adminId = adminId;
        this.operation = operation;
        this.status = status;
        this.createTime = createTime;
    }

    public Log() {
    }
}
