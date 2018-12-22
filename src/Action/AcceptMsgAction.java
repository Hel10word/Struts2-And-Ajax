/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2018年12月21日 上午9:19:49
 *
 *功能描述:
 */
package Action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import DAO.AllInfoDao;
import domain.AllInfo;

public class AcceptMsgAction extends ActionSupport {
    private String UserName;
    private String SendName;
    private List<AllInfo> list;
    public List<AllInfo> getList() {
        return list;
    }
    public void setList(List<AllInfo> list) {
        this.list = list;
    }
    public void setUserName(String userName) {
        UserName = userName;
    }
    public String getSendName() {
        return SendName;
    }
    public void setSendName(String sendName) {
        SendName = sendName;
    }

    public String execute() {
        System.out.println("调用了 accept()"+UserName+"  "+SendName);
        AllInfoDao allInfoDao = new AllInfoDao();
        setList(allInfoDao.HistoryMsg(SendName, UserName));
        System.out.println(list);
        return SUCCESS;
    }

}
