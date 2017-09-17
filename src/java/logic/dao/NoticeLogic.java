package logic.dao;

import connect.dao.Connection1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeLogic 
{
    Connection con;
public String[] getNoticeMain()
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] noticeItem=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select Detail from add_new_notice where type=?");
          abc.setString(1,"superadmin");
          ResultSet rs=abc.executeQuery();
          while(rs.next())
          {
           al.add(rs.getString(1));
          }
          noticeItem=al.toArray(new String[al.size()]);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return noticeItem;
    }    

public String[] getNoticeDept()
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] noticeItem=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select Detail from add_new_notice where type=?");
          abc.setString(1,"deptadmin");
          ResultSet rs=abc.executeQuery();
          while(rs.next())
          {
           al.add(rs.getString(1));
          }
          noticeItem=al.toArray(new String[al.size()]);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return noticeItem;
    }    
public String[] getNoticeClub()
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] noticeItem=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select Detail from add_new_notice where type=?");
          abc.setString(1,"clubadmin");
          ResultSet rs=abc.executeQuery();
          while(rs.next())
          {
           al.add(rs.getString(1));
          }
          noticeItem=al.toArray(new String[al.size()]);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return noticeItem;
    }    

public Boolean addNotice(String Heading,String Date,String Detail,String type)
{
    Boolean update=false;
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("insert into add_new_notice values(?,?,?,?)");
          abc.setString(1,Heading);
          abc.setString(2,Date);
          abc.setString(3,Detail);
          abc.setString(4,type);
          int status=abc.executeUpdate();
          if(status>0)
          {
              update=true;
          }
          else
          {
              update=false;
          }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return update;
}
}