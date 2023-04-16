/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbapp_package;

import java.util.*;
import java.sql.*;

public class Residents {
    
    public int resident_id;
    public int renter;
    public String relationship;
    public int undertaking;
    public String authorized;
    public int household_id;
    public String last_update;
    
    public ArrayList<Integer>residentID_List = new ArrayList<>();
    public ArrayList<String>residentName_List = new ArrayList<>();    
    
    public Residents(){}
    
    public void getResidentRecords(){
        
        try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               


                PreparedStatement pstmt = con.prepareStatement("SELECT r.resident_id, CONCAT(p.firstname, ' ', p.lastname) as residentname FROM residents r JOIN people p ON r.resident_id = p.peopleid");
                ResultSet resultSet = pstmt.executeQuery();     

                // Initialize ArrayLists
                residentID_List.clear();
                residentName_List.clear();


                while(resultSet.next()){                
                    residentID_List.add(resultSet.getInt("r.resident_id"));       
                    residentName_List.add(resultSet.getString("residentname"));
                }     

                pstmt.close();
                con.close();

                System.out.println("getResidentRecords successful");                   


        }catch(Exception e){

            System.out.println(e.getMessage());
        }          
 
        
        
}

}