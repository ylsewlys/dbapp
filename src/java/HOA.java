/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbapp_package;

import java.util.*;
import java.sql.*;

/**
 *
 * @author ccslearner
 */
public class HOA {
    
    // Fields of hoa table
    public String hoa_name;
    public int ofaddr_streetno;
    public String ofcaddr_barangay;
    public String ofcaddr_city;
    public String ofcaddr_province;
    public double ofcaddr_lattitude;
    public double ofcaddr_longitude;
    public String year_establishment;
    public String website;
    public String subdivision_name;
    public String req_scannedarticles;
    public String req_notarizedbylaws;
    public String req_minutes;
    public String req_attendance;
    public String req_certification;
    public String req_codeethics;
    public double req_regularmonthly;
    public int req_collectionday;
    
    // Arraylists
    
    public ArrayList<String> hoaNameList = new ArrayList<>();
        
    public int getHOANameRecords(){
        try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               
               
               
                PreparedStatement pstmt = con.prepareStatement("SELECT hoa_name FROM hoa");
                ResultSet resultSet = pstmt.executeQuery();     
                
                // Initialize ArrayLists
                hoaNameList.clear();
                
                while(resultSet.next()){                
                    hoaNameList.add(resultSet.getString("hoa_name"));                              
                }     
                
                pstmt.close();
                con.close();
            
                System.out.println("getHOANameRecords successful");                   
             
                return 1;
        }catch(Exception e){
            
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    
    
    
    
    
}
