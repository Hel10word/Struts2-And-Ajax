/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2018年12月19日 上午11:01:28
 *
 *功能描述:
 */
package Action;

import DAO.AllInfoDao;

public class UpdateIsReadeAction {
    private String ReceiveName;
    private String SendName;
    public String getReceiveName() {
        return ReceiveName;
    }
    public void setReceiveName(String receiveName) {
        ReceiveName = receiveName;
    }
    public String getSendName() {
        return SendName;
    }
    public void setSendName(String sendName) {
        SendName = sendName;
    }
    public String execute() {
        AllInfoDao allInfoDao = new AllInfoDao();
        System.out.println("执行了 将消息更变为已读    "+ReceiveName+"   "+SendName);
        allInfoDao.UpDateMsgIsRead(ReceiveName, SendName);
        return "ok";
    }
}
