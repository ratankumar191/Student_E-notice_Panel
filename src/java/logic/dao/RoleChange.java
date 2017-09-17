package logic.dao;

import connect.dao.Connection1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RoleChange {
public Boolean changeRole(String newrole,String user)
 {
    Connection con;
    Boolean update=false;
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("UPDATE login_master SET type=? where userId=?");
          abc.setString(1,newrole);
          abc.setString(2,user);
          int status=abc.executeUpdate();
          
          if(status>0)
          {
              con=Connection1.dbConnection();
              PreparedStatement abc1=con.prepareStatement("delete from role_change where userId=?");
              abc1.setString(1,user);
              int status1=abc1.executeUpdate();
              if(status1>0)
              {
              update=true;
              }
              else
              {
                  update=false;
              }
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

public String checkRole(String userId)
 {
    Connection con;
    String type="null";
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select type from login_master where userId=?");
          abc.setString(1,userId);
          ResultSet rs=abc.executeQuery();
          if(rs.next())
          {
              type=rs.getString(1);
          }
          else
          {
              type="null";
          }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return type;
}    

public Boolean requestChange(String user,String oldrole,String newrole)
 {
    Connection con;
    Boolean update=false;
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("insert into role_change values(?,?,?)");
          abc.setString(1,user);
          abc.setString(2,oldrole);
          abc.setString(3,newrole);
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

public String checkNewRole(String userId)
 {
    Connection con;
    String type="null";
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select requestedrole from role_change where userId=?");
          abc.setString(1,userId);
          ResultSet rs=abc.executeQuery();
          if(rs.next())
          {
              type=rs.getString(1);
          }
          else
          {
              type="null";
          }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return type;
}    
}
