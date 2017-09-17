package logic.dao;

import connect.dao.Connection1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserAuthentication {
    Connection con;
    public String[] getunauthUser(String status)
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] menuItem=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select userId from login_master where AuthenticationStatus=?");
          abc.setString(1,status);
          ResultSet rs=abc.executeQuery();
          while(rs.next())
          {
           al.add(rs.getString(1));
          }
          menuItem=al.toArray(new String[al.size()]);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return menuItem;
    }
    
    public Boolean authenticateUser(String[] user)
    {
        Boolean update=false;
        int sz=user.length;
        try{
          con=Connection1.dbConnection();
          
          PreparedStatement abc=con.prepareStatement("UPDATE login_master SET AuthenticationStatus=? where userId=?");
          for(int i=0;i<sz;i++)
          {
          abc.setString(1,"true");
          abc.setString(2,user[i]);
          abc.addBatch();
          }
          int arr[]=abc.executeBatch();
          if(arr.length==sz)
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
