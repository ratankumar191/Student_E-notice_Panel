package connect.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connection1 {
    static Connection con;
        public static Connection dbConnection()
        {
         try
         {
             Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","ratan");
             
         }   
         catch(Exception e)
         {
             System.out.println(e);
         }
         return con;
        }
}
