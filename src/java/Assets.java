/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbapp_package;

/**
 *
 * @author Wesly
 */
import java.util.*;
import java.sql.*;


public class Assets{
        
        // Fields of assets
        public int asset_id;
        public String asset_name;
        public String asset_description;
        public String acquisition_date;
        public int forrent;
        public double asset_value;
        public String type_asset;
        public String status;
        public double loc_lattitude;
        public double loc_longiture;
        public String hoa_name;
        public int enclosing_asset;
        
    
        // List of assets
        public ArrayList<Integer> assetID_List = new ArrayList<>();
        public ArrayList<String> assetName_List = new ArrayList<>();

        
        public Assets(){

        }
    
        
        
        // Getters
        
        public void getAssetIdRecords(){
            try{
                    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                    System.out.println("Database Connection Successful...");               


                    PreparedStatement pstmt = con.prepareStatement("SELECT asset_id FROM assets");
                    ResultSet resultSet = pstmt.executeQuery();     

                    // Initialize ArrayLists
                    assetID_List.clear();


                    while(resultSet.next()){                
                        assetID_List.add(resultSet.getInt("asset_id"));                              
                    }     

                    pstmt.close();
                    con.close();

                    System.out.println("getAssetIdRecords successful");                   


            }catch(Exception e){

                System.out.println(e.getMessage());
            }            
            
        }
        
        public void getAssetNameRecords(){
            try{
                    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                    System.out.println("Database Connection Successful...");               


                    PreparedStatement pstmt = con.prepareStatement("SELECT asset_name FROM assets");
                    ResultSet resultSet = pstmt.executeQuery();     

                    // Initialize ArrayLists
                    assetName_List.clear();

                    while(resultSet.next()){                
                        assetName_List.add(resultSet.getString("asset_name"));                              
                    }     

                    pstmt.close();
                    con.close();

                    System.out.println("getAssetNameRecords successful");                   


            }catch(Exception e){

                System.out.println(e.getMessage());
            }            
            
        }        
        
        
    

    
        // Functions
        
       public int registerAsset(){
           
           try{
               // Connect to database;
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
            System.out.println("Connection Successful...");
            
            PreparedStatement pstmt = con.prepareStatement("SELECT MAX(asset_id) + 1 AS newID FROM assets");
            ResultSet resultSet = pstmt.executeQuery();

            while(resultSet.next()){
                asset_id = resultSet.getInt("newID");
            }
            
            // Save the new asset
            
            pstmt = con.prepareStatement("INSERT INTO assets (asset_id, asset_name, asset_description, acquisition_date, forrent, asset_value, type_asset, status, loc_lattitude, loc_longiture, hoa_name, enclosing_asset) "
                    + "VALUE(?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?)");
            
                       
            pstmt.setInt(1, asset_id);
            pstmt.setString(2, asset_name);     
            pstmt.setString(3, asset_description);
            pstmt.setInt(4, forrent);
            pstmt.setDouble(5, asset_value);
            pstmt.setString(6, type_asset);
            pstmt.setString(7, status); 
            pstmt.setDouble(8, loc_lattitude);
            pstmt.setDouble(9, loc_longiture);
            pstmt.setString(10, hoa_name);
            
            if (!(enclosing_asset == -1)){
                pstmt.setInt(11, enclosing_asset);                
            } else{
                pstmt.setNull(11, Types.INTEGER);
            }

            
            
            pstmt.executeUpdate();
            
            pstmt.close();
            con.close();
            
            System.out.println("Program successful");
            
            return 1;
               
           
           } catch (Exception e){
               
               System.out.println(e.getMessage());
               System.out.println("ERROR");
               return 0;
           }
           
  
       }
   

    
    
    
    public static void main(String args[]){    

        Assets a = new Assets();
        a.asset_id = 5015;
        a.asset_name = "Cooper's Dog Food";
        a.asset_description = "Yum";
        a.acquisition_date = "123123";
        a.forrent = 0;
        a.asset_value = 599;
        a.type_asset = "F";
        a.status = "D";
        a.loc_lattitude = 123;
        a.loc_longiture = 534;
        a.hoa_name = "SJH";
        a.enclosing_asset = -1;
        
        a.registerAsset();
        
        
        
    }
        
}

