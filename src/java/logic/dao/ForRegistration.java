package logic.dao;

import connect.dao.Connection1;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ForRegistration {
Connection con;
PreparedStatement pst;

    public int register(String userId,String password,String type,String auth)
    {
        int status=0;
        try
        {
        con=Connection1.dbConnection();
        pst=con.prepareStatement("insert into login_master values(?,?,?,?)");
        pst.setString(1,userId);
        pst.setString(2,password);
        pst.setString(3,type);
        pst.setString(4,auth);
        status=pst.executeUpdate();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return status;
    }
}
