/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2019年1月8日 下午2:59:27
 *
 *功能描述:
 */
package Action;

import com.opensymphony.xwork2.ActionSupport;

import DAO.AllInfoDao;

public class DeleteMsgAction extends ActionSupport {
    private String Time;
    private String SendName;
    private String ReceiveName;
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
    public String execute() {
        AllInfoDao allInfoDao = new AllInfoDao();
//        System.out.println(SendName+"  "+ReceiveName+"  "+Time);
        allInfoDao.DeleteMsg(SendName,ReceiveName,Time);
        return SUCCESS;
    }

}
