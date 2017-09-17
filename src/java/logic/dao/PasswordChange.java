package logic.dao;

import connect.dao.Connection1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PasswordChange 
{
public Boolean changePassword(String newpassword,String v,String password)
 {
    Connection con;
    Boolean update=false;
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("UPDATE login_master SET password=? where userId=? and password=?");
          abc.setString(1,newpassword);
          abc.setString(2,v);
          abc.setString(3,password);
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

public String checkPassword(String userId)
 {
    Connection con;
    String pass="null";
    try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select password from login_master where userId=?");
          abc.setString(1,userId);
          ResultSet rs=abc.executeQuery();
          if(rs.next())
          {
              pass=rs.getString(1);
          }
          else
          {
              pass="null";
          }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return pass;
}

}
