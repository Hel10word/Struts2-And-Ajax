/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2019年1月1日 下午4:26:19
 *
 *功能描述:
 */
package Action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import DAO.AllInfoDao;
import domain.AllInfo;

public class SelectAction extends ActionSupport {
    private List<AllInfo> list;

    public List<AllInfo> getList() {
        return list;
    }

    public void setList(List<AllInfo> list) {
        this.list = list;
    }
    public String execute() {
        AllInfoDao allInfoDao = new AllInfoDao();
        setList(allInfoDao.SelectAllData());
        return SUCCESS;
    }

}
