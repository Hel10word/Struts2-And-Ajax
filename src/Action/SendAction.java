/**
 * @Package: Action
 * @author : 张不凡
 * @date: 2018年12月18日 上午11:33:24
 *
 *功能描述:
 */
package Action;

import DAO.AllInfoDao;
import domain.AllInfo;

public class SendAction {
//  用户输入的内容
  private String SendName;
  private String Content;
  private String ReceiveName;
  private String Time;
  
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
    
    
    public String getTime() {
        return Time;
    }
    
    
    public void setTime(String time) {
        Time = time;
    }

  
      public String execute() {
          System.out.println("----用户输入的信息-----");
          System.out.println("收件人：" + ReceiveName + "   内容：" + Content + " 发件人：" + SendName + "  时间："+Time);
          AllInfoDao allInfoDao = new AllInfoDao();
          allInfoDao.NewMsg(new AllInfo(SendName,Content,ReceiveName,"N",Time));
          return "ok";
      }
    
}
