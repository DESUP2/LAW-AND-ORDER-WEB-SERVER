package database;



import java.sql.*;  


public class dncon {

  String dbURL = "jdbc:db2:LAW";
  String dbDriver = "com.ibm.db2.jcc.DB2Driver"; 
  private Connection dbCon;

  public dncon(){  
       super();        
       }

  public boolean connect() throws ClassNotFoundException,SQLException{ 
          Class.forName(dbDriver); 
          dbCon = DriverManager.getConnection(dbURL); 
          return true; 
        }

 

  public void close() throws SQLException{ 
        dbCon.close(); 
       }

  public ResultSet execSQL(String sql) throws SQLException{

                    Statement s = dbCon.createStatement(); 
                    ResultSet r = s.executeQuery(sql); 
                    return (r == null) ? null : r; 
                    }

  public int updateSQL(String sql) throws SQLException{                     
                   Statement s = dbCon.createStatement();
                   int r = s.executeUpdate(sql);
                   return (r == 0) ? 0 : r; 
                }

}
