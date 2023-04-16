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
        public Double asset_value;
        public String type_asset;
        public String status;
        public Double loc_lattitude;
        public Double loc_longiture;
        public String hoa_name;
        public Integer enclosing_asset;
        
        
        // Original fields of assets (For data retaining purposes)
        
        public String original_asset_name;
        public String original_asset_description;
        public String original_acquisition_date;
        public Integer original_forrent;
        public Double original_asset_value;
        public String original_type_asset;
        public String original_status;
        public Double original_loc_lattitude;
        public Double original_loc_longiture;
        public String original_hoa_name;
        public Integer original_enclosing_asset;        
        
        
        
        
    
        // List of assets
        public ArrayList<Integer> assetID_List = new ArrayList<>();
        public ArrayList<String> assetName_List = new ArrayList<>();

        // List of disposable assets
        public ArrayList<Integer> assetID_DisposeList = new ArrayList<>();
        public ArrayList<String> assetName_DisposeList = new ArrayList<>();
        
        public Assets(){

        }
    
        
        
        // Getters
        
        public void getAssetIdRecords(){
            try{
                    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                    System.out.println("Database Connection Successful...");               


                    PreparedStatement pstmt = con.prepareStatement("SELECT asset_id FROM assets ORDER BY asset_id");
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


                    PreparedStatement pstmt = con.prepareStatement("SELECT asset_id, asset_name FROM assets ORDER BY asset_id");
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
       
       public void storeDisposableAssets(){
           
           
           
           try{
           
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               

                PreparedStatement pstmt = con.prepareStatement("SELECT a.asset_id, a.asset_name FROM assets a WHERE a.asset_id NOT IN (SELECT ar.asset_id FROM asset_rentals ar WHERE ar.status LIKE '%R%' OR ar.status LIKE '%O%') AND a.asset_id NOT IN (SELECT ac.asset_id FROM asset_activity ac WHERE ac.status NOT LIKE '%C%') AND a.status != 'X' ORDER BY a.asset_id");
                ResultSet resultSet = pstmt.executeQuery();                 
                
                // Initialize ArrayLists
                assetID_DisposeList.clear();
                assetName_DisposeList.clear();         
                
                while(resultSet.next()){
                    assetID_DisposeList.add(resultSet.getInt("a.asset_id"));
                    assetName_DisposeList.add(resultSet.getString("a.asset_name"));                       
   
                }
                
                pstmt.close();
                con.close();

                System.out.println("storeDisposableAssets successful");                   
          
           
           }
           catch(Exception e){
               System.out.println(e.getMessage());
               System.out.println("ERROR");              
           }
            
            
       
            
       }
       
      
       
               
               
               
        public void storeOriginalAssetInfo(){

            try{
                    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                    System.out.println("Database Connection Successful...");               


                    PreparedStatement pstmt = con.prepareStatement("SELECT asset_id, asset_name, asset_description, acquisition_date, forrent, asset_value, type_asset, status, loc_lattitude, loc_longiture, hoa_name, enclosing_asset FROM assets WHERE asset_id=?");
                    pstmt.setInt(1, asset_id);


                    ResultSet resultSet = pstmt.executeQuery();     

                    while(resultSet.next()){  
                        original_asset_name = resultSet.getString("asset_name");
                        original_asset_description = resultSet.getString("asset_description");
                        original_acquisition_date = resultSet.getString("acquisition_date");
                        original_forrent = resultSet.getInt("forrent");
                        original_asset_value = resultSet.getDouble("asset_value");
                        original_type_asset = resultSet.getString("type_asset");
                        original_status = resultSet.getString("status");
                        original_loc_lattitude = resultSet.getDouble("loc_lattitude");
                        original_loc_longiture = resultSet.getDouble("loc_longiture");
                        original_hoa_name = resultSet.getString("hoa_name");
                        original_enclosing_asset = resultSet.getInt("enclosing_asset");                       

                    }     

                    pstmt.close();
                    con.close();

                    System.out.println("getOriginalAssetInfo successful");                   


            }catch(Exception e){

                System.out.println(e.getMessage());
            }          

        }
       
    public int updateAssetInfo(){
        
        
           try{
               // Connect to database;
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
            System.out.println("Connection Successful...");
            
            



            // Update asset's information
            PreparedStatement pstmt = con.prepareStatement("SET FOREIGN_KEY_CHECKS = ?");
            
            pstmt.setInt(1, 0); // Disable foreign key checks
            pstmt.executeUpdate();
            

            pstmt = con.prepareStatement("UPDATE assets SET asset_name=?, asset_description=?, acquisition_date=?, forrent=?, asset_value=?, type_asset=?, status=?, loc_lattitude=?, loc_longiture=?, hoa_name=?, enclosing_asset=? WHERE asset_id=?");

                


            pstmt.setString(1, asset_name);   
            

            pstmt.setString(2, asset_description);   
             
            pstmt.setString(3, acquisition_date);
            
             
            pstmt.setInt(4, forrent);

            pstmt.setDouble(5, asset_value);
         
            pstmt.setString(6, type_asset);
            
            pstmt.setString(7, status);
           
            pstmt.setDouble(8, loc_lattitude);
       
            pstmt.setDouble(9, loc_longiture);
            
            pstmt.setString(10, hoa_name);
        
            if (enclosing_asset != null){
                pstmt.setInt(11, enclosing_asset);
            } else if(original_enclosing_asset != null){
                pstmt.setInt(11, original_enclosing_asset);
            } else{
                pstmt.setNull(11, Types.INTEGER);
            }
            
            pstmt.setInt(12, asset_id);
            
            pstmt.executeUpdate();
            
            pstmt = con.prepareStatement("SET FOREIGN_KEY_CHECKS = ?");
            
            pstmt.setInt(1, 1); // Enable foreign key checks
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
    
    public int disposeAsset(){
        
           try{
               // Connect to database;
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
            System.out.println("Connection Successful...");
            
            



            // Dispose Asset           
            PreparedStatement pstmt = con.prepareStatement("UPDATE assets SET status = 'X', forrent = 0 WHERE asset_id=?");
            pstmt.setInt(1, asset_id);   
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
    
    
    /*
    
    public static void main(String args[]){
        
        Assets A = new Assets();
        
        A.asset_id = 5001;
        A.asset_name = "KASHDKAS";
        A.asset_description = "desc";
        A.acquisition_date = "2025-05-09";
        A.forrent = 1;
        A.asset_value = 70.0;
        A.type_asset = "P";
        A.status = "W";
        A.loc_lattitude = 55.45;
        A.loc_longiture = 23.56;
        A.hoa_name = "SMH";
        A.enclosing_asset = null;
        
        A.updateAssetInfo();

        
        
    }
    
    
    */
        
}

