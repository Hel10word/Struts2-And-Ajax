/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2019年1月8日 下午4:11:45
 *
 *功能描述:
 */
package Action;

import com.opensymphony.xwork2.ActionSupport;

import DAO.AllInfoDao;
import domain.AllInfo;

public class ServerUpdateMsgAction extends ActionSupport {
    private String Time;
    private String SendName;
    private String ReceiveName;
    private String Content;
    private String IsReade;
    public String getTime() {
        return Time;
    }
    public void setTime(String time) {
        Time = time;
    }
    public String getSendName() {
        return SendName;
    }
    public void setSendName(String sendName) {
        SendName = sendName;
    }
    public String getReceiveName() {
        return ReceiveName;
    }
    public void setReceiveName(String receiveName) {
        ReceiveName = receiveName;
    }
    public String getContent() {
        return Content;
    }
    public void setContent(String content) {
        Content = content;
    }
    public String getIsReade() {
        return IsReade;
    }
    public void setIsReade(String isReade) {
        IsReade = isReade;
    }
    public String execute() {
        AllInfo allInfo = new AllInfo();
        allInfo.setContent(Content);
        allInfo.setIsRead(IsReade);
        allInfo.setReceiveName(ReceiveName);
        allInfo.setSendName(SendName);
        allInfo.setTime(Time);
        AllInfoDao allInfoDao = new AllInfoDao();
        allInfoDao.ServerUpdateMsg(allInfo);
        return SUCCESS;
    }
    
}
