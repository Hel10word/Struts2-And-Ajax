/**
 * @Package: domain
 * @author : 张不凡
 * @date: 2018年12月13日 下午2:22:25
 *
 *功能描述:
 */
package domain;

public class AllInfo {
    private String SendName;
    private String Content;
    private String ReceiveName;
    private String IsRead;
    private String Time;
    public AllInfo() {
        super();
        // TODO Auto-generated constructor stub
    }
    public AllInfo(String sendName, String content, String receiveName, String isread, String time) {
        super();
        SendName = sendName;
        Content = content;
        ReceiveName = receiveName;
        IsRead = isread;
        Time = time;
    }
    public String getSendName() {
        return SendName;
    }
    public void setSendName(String sendName) {
        SendName = sendName;
    }
    public String getContent() {
        return Content;
    }
    public void setContent(String content) {
        Content = content;
    }
    public String getReceiveName() {
        return ReceiveName;
    }
    public void setReceiveName(String receiveName) {
        ReceiveName = receiveName;
    }
    public String getIsRead() {
        return IsRead;
    }
    public void setIsRead(String isread) {
        IsRead = isread;
    }
    public String getTime() {
        return Time;
    }
    public void setTime(String time) {
        Time = time;
    }
    

}
