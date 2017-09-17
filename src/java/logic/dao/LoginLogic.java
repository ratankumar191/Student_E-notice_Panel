package logic.dao;

import connect.dao.Connection1;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LoginLogic {
    Connection con;
    PreparedStatement pst;
    public String loginValidate(String userId, String password)
    {
     String t ="null";
     try
     {
        con=Connection1.dbConnection();
        PreparedStatement pst=con.prepareStatement("select AuthenticationStatus from login_master where userId=? and password=?");
        pst.setString(1,userId);
        pst.setString(2,password);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
          t=rs.getString(1);
        }
        else
        {
          System.out.println("type not found");
        } 
     }
     catch(Exception e)
     {
       out.println(e);    
     }
     return t;
    }
    
    public String getMenu(String userId)
    {
        String t="null";
        //Boolean no1=false;
     try
     {
        con=Connection1.dbConnection();
        PreparedStatement pst=con.prepareStatement("select type from login_master where userId=?");
        pst.setString(1,userId);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
          t=rs.getString(1);
        }
        else
        {
            t="null";
        }
     }
     catch(Exception e)
     {
       out.println(e);    
     }
    return t;
}
    
    public String[] getResource(String type)
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] menuItem=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select Resource from type_resource_map where type=?");
          abc.setString(1,type);
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
    
    public String[] getUrl(String type)
    {
        ArrayList<String> al=new ArrayList<String>();
        String[] url=new String[al.size()];
        try{
          con=Connection1.dbConnection();
          PreparedStatement abc=con.prepareStatement("select URL from type_resource_map where type=?");
          abc.setString(1,type);
          ResultSet rs=abc.executeQuery();
          while(rs.next())
          {
           al.add(rs.getString(1));
          }
          url=al.toArray(new String[al.size()]);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return url;
    }
    
    
}