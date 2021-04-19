package com.ai.chat.pojo;

public class Message {
    private String fromId;
    private String toId;
    private String msg;
    private String sendTime;

    @Override
    public String toString() {
        return "Message{" +
                "fromId='" + fromId + '\'' +
                ", toId='" + toId + '\'' +
                ", msg='" + msg + '\'' +
                ", sendTime='" + sendTime + '\'' +
                '}';
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public String getToId() {
        return toId;
    }

    public void setToId(String toId) {
        this.toId = toId;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public Message() {
    }

    public Message(String fromId, String toId, String msg, String sendTime) {
        this.fromId = fromId;
        this.toId = toId;
        this.msg = msg;
        this.sendTime = sendTime;
    }
}
