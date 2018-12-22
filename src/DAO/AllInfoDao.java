/**
 * @Package: DAO
 * @author : 张不凡
 * @date: 2018年12月13日 下午2:26:46
 *
 *功能描述:
 */
package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import domain.AllInfo;
import util.DBHelper;

public class AllInfoDao extends BaseDao {

    //    添加消息记录
    public void NewMsg(AllInfo allInfo) {
        String sql = "INSERT INTO allinfo(SendName,Content,ReceiveName,IsRead,Time)VALUE(?,?,?,?,?)";
        conn = DBHelper.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, allInfo.getSendName());
            ps.setString(2, allInfo.getContent());
            ps.setString(3, allInfo.getReceiveName());
            ps.setString(4, allInfo.getIsRead());
            ps.setString(5, allInfo.getTime());
            ps.executeUpdate();
            System.out.println("您成功的发送了一条消息");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBHelper.closeResource(conn, ps, rs);
        }
    }
    
    public Map<String, Integer> SearchMsgByReceiveNameOrSendName(String name) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        String sql = "select * from allinfo  where SendName = ? or ReceiveName = ?;";
        conn = DBHelper.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                String RName = rs.getString("ReceiveName");
                String SName = rs.getString("SendName");
                String IsRead = rs.getString("IsRead");
//                System.out.println("查询的姓名："+name+"   RName:"+RName+"   SName:"+SName+"   IsRead:"+IsRead);
//                如果用户是发件人
                if(SName.equals(name)) {
                    if(!map.containsKey(RName))
                        map.put(RName, 0);
                }else {
                    if(map.containsKey(SName)) {
                        if(IsRead.equals("N"))
                            map.put(SName, map.get(SName)+1);

                    }else {
                        if(IsRead.equals("Y"))
                            map.put(SName, 0);
                        else 
                            map.put(SName, 1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBHelper.closeResource(conn, ps, rs);
        }
        return map;
    }
    
//    修改消息为已读
    public void UpDateMsgIsRead(String receiveName , String sendName) {
        String sql = "update allinfo set IsRead = 'Y' where SendName = ? and ReceiveName = ?";
        conn = DBHelper.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,sendName);
            ps.setString(2,receiveName);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBHelper.closeResource(conn, ps, rs);
        }
    }
    
//    查询历史消息
    public List<AllInfo> HistoryMsg(String sendName,String receiveName){
        List<AllInfo> list = new ArrayList<AllInfo>();
        String sql = "select * from allinfo where (SendName = ? and ReceiveName = ?)or(SendName = ? and ReceiveName = ?)";
        conn = DBHelper.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,sendName);
            ps.setString(2,receiveName);
            ps.setString(3,receiveName);
            ps.setString(4,sendName);
            rs = ps.executeQuery();
            while (rs.next()) {
                AllInfo item = new AllInfo();
                item.setSendName(rs.getString("SendName"));
                item.setReceiveName(rs.getString("ReceiveName"));
                item.setContent(rs.getString("Content"));
                item.setTime(rs.getString("Time"));
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBHelper.closeResource(conn, ps, rs);
        }
        return list;
    }

}
