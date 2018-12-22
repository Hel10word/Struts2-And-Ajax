/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2018年12月18日 下午1:05:37
 *
 *功能描述:
 */
package Action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import DAO.AllInfoDao;
import domain.AllInfo;

public class RefreshAction {
    private String UserName;
    public String getUserName() {
        return UserName;
    }
    public void setUserName(String userName) {
        UserName = userName;
    }
    public String execute() {
        System.out.println("UserName:"+UserName);
        AllInfoDao allInfoDao = new AllInfoDao();
        ActionContext actionContext=ActionContext.getContext();
        Map<String, Integer> map = allInfoDao.SearchMsgByReceiveNameOrSendName(UserName);
        actionContext.getSession().put("map", map);
        return "ok";
    }

}
