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
public class AssetRentals {
    
    public int asset_id;
    public String rental_date;
    public String reservation_date;
    public Integer resident_id;
    public Double rental_amount;
    public Double discount;
    public String status;
    public String inspection_details;
    public Double assessed_value;
    public Integer accept_hoid;
    public String accept_position;
    public String accept_electiondate;
    public String return_date;
    
    public int original_asset_id;
    public String original_rental_date;
    public String original_reservation_date;
    public Integer original_resident_id;
    public Double original_rental_amount;
    public Double original_discount;
    public String original_status;
    public String original_inspection_details;
    public Double original_assessed_value;
    public Integer original_accept_hoid;
    public String original_accept_position;
    public String original_accept_electiondate;
    public String original_return_date;    
    
    
    
    
    
    
    
    
    
    public ArrayList<Integer> assetID_List = new ArrayList<>();  
    public ArrayList<String> assetName_List = new ArrayList<>();
    public ArrayList<String> rentalDate_List = new ArrayList<>();  
    public ArrayList<Integer> assetRenterID_List = new ArrayList<>();       
    
    public ArrayList<Integer> residentID_List = new ArrayList<>();   
 
    
    public ArrayList<Integer> officerID_List = new ArrayList<>();   
    public ArrayList<String> officerName_List = new ArrayList<>(); 
    public ArrayList<String> officerPosition_List = new ArrayList<>();    
    public ArrayList<String> officerElectionDate_List = new ArrayList<>();     
    
    public void getAssetRecords(){   
        try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               

                
                
                PreparedStatement pstmt = con.prepareStatement("SELECT ar.asset_id, a.asset_name, ar.rental_date, ar.resident_id FROM asset_rentals ar JOIN assets a ON ar.asset_id = a.asset_id");
                ResultSet resultSet = pstmt.executeQuery();     
                
                

                // Initialize ArrayLists
                assetID_List.clear();
                assetName_List.clear();
                rentalDate_List.clear();
                assetRenterID_List.clear();


                while(resultSet.next()){                
                    assetID_List.add(resultSet.getInt("ar.asset_id"));   
                    assetName_List.add(resultSet.getString("a.asset_name"));
                    rentalDate_List.add(resultSet.getString("ar.rental_date"));
                    assetRenterID_List.add(resultSet.getInt("ar.resident_id"));
                }     

                pstmt.close();
                con.close();

                System.out.println("getAssetIdRecords successful");                   


        }catch(Exception e){

            System.out.println(e.getMessage());
        }          
      
    }
    
    
    
    public void getResidentIDRecords(){
        
        try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               


                PreparedStatement pstmt = con.prepareStatement("SELECT resident_id FROM residents");
                ResultSet resultSet = pstmt.executeQuery();     

                // Initialize ArrayLists
                residentID_List.clear();


                while(resultSet.next()){                
                    residentID_List.add(resultSet.getInt("resident_id"));                              
                }     

                pstmt.close();
                con.close();

                System.out.println("getResidentIdRecords successful");                   


        }catch(Exception e){

            System.out.println(e.getMessage());
        }          
             
    }   
    
    public void getOriginalRentalInfo(){
        
        try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               


                PreparedStatement pstmt = con.prepareStatement("SELECT asset_id, rental_date, reservation_date, resident_id, rental_amount, discount, status, inspection_details, assessed_value, accept_hoid, accept_position, accept_electiondate, return_date FROM asset_rentals WHERE asset_id=? AND rental_date=?");
                pstmt.setInt(1, asset_id);
                pstmt.setString(2, rental_date);
                               
                ResultSet resultSet = pstmt.executeQuery();     

                // Initialize ArrayLists



                while(resultSet.next()){            
                    original_asset_id = resultSet.getInt("asset_id");
                    original_rental_date = resultSet.getString("rental_date");
                    original_reservation_date = resultSet.getString("reservation_date")     ;               
                    original_resident_id = resultSet.getInt("resident_id");            
                    original_rental_amount = resultSet.getDouble("rental_amount");
                    original_discount = resultSet.getDouble("discount");
                    original_status = resultSet.getString("status");
                    original_inspection_details = resultSet.getString("inspection_details");
                    original_assessed_value = resultSet.getDouble("assessed_value");
                    original_accept_hoid = resultSet.getInt("accept_hoid");
                    original_accept_position = resultSet.getString("accept_position");
                    original_accept_electiondate = resultSet.getString("accept_electiondate");
                    original_return_date = resultSet.getString("return_date");
                    
                    
                }     

                pstmt.close();
                con.close();

                System.out.println("getOriginalRentalInfo successful");                   


        }catch(Exception e){

            System.out.println(e.getMessage());
        }          
                   
        
        
        
    }
    
    public void getOfficerRecords(){
        
         try{
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
                System.out.println("Database Connection Successful...");               


                PreparedStatement pstmt = con.prepareStatement("SELECT o.ho_id, CONCAT(p.firstname, ' ', p.lastname) AS officername, o.position, o.election_date FROM officer o JOIN people p ON o.ho_id = p.peopleid");
                ResultSet resultSet = pstmt.executeQuery();     

                // Initialize ArrayLists
                officerID_List.clear();
                officerName_List.clear();
                officerPosition_List.clear();
                officerElectionDate_List.clear();
                


                while(resultSet.next()){                
                    officerID_List.add(resultSet.getInt("o.ho_id"));    
                    officerName_List.add(resultSet.getString("officername"));
                    officerPosition_List.add(resultSet.getString("o.position"));
                    officerElectionDate_List.add(resultSet.getString("o.election_date"));                   
                }     

                pstmt.close();
                con.close();

                System.out.println("getOfficerRecords successful");                   


        }catch(Exception e){

            System.out.println(e.getMessage());
        }          
        
         
   
        
    }
    
    public int updateRentalInformation(){
           try{
               // Connect to database;
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/HOADB?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");  
            System.out.println("Connection Successful...");
            
            
            getOriginalRentalInfo();


            // Update asset's rental information
  
            PreparedStatement pstmt = con.prepareStatement("UPDATE asset_rentals SET asset_id=?, rental_date=?, reservation_date=?, resident_id=?, rental_amount=?, discount=?, status=?, inspection_details=?, assessed_value=?, accept_hoid=?, accept_position=?, accept_electiondate=?, return_date=? WHERE asset_id=? AND rental_date=?");

            pstmt.setInt(1, asset_id);
            pstmt.setString(2, rental_date);    
            
            if(reservation_date != null){
                pstmt.setString(3, reservation_date);               
            } else if (!(original_reservation_date == null)){
                pstmt.setString(3, original_reservation_date);
            } else{
                pstmt.setString(3, "");
            }

                  
            if(resident_id != -1){
                pstmt.setInt(4, resident_id);          
            } else if (original_resident_id != null){
                pstmt.setInt(4, original_resident_id);
            } 

            
            if (rental_amount != null){
                pstmt.setDouble(5, rental_amount);                
            }else if (original_rental_amount != null){
                pstmt.setDouble(5, original_rental_amount);                  
            } else{
                pstmt.setNull(5, Types.DOUBLE);    
            }
            
            if (discount != null){
                pstmt.setDouble(6, discount);                
            } else if (original_discount != null){
                pstmt.setDouble(6, original_discount);
            } else{
                pstmt.setNull(6, Types.DOUBLE);
            }

            if(!(status.compareTo("") == 0)){
                pstmt.setString(7, status);                 
            } else{
                pstmt.setString(7, original_status);
            }

            
            if(!(inspection_details.compareTo("") == 0)){
                pstmt.setString(8, inspection_details);                
            }else if (original_inspection_details != null){
                pstmt.setString(8, original_inspection_details);
            }else{
                pstmt.setString(8, "");
            }

              
            if (assessed_value != null){
                pstmt.setDouble(9, assessed_value);               
            }else if (original_assessed_value != null){
                pstmt.setDouble(9, original_assessed_value);
            }else{
                pstmt.setNull(9, Types.DOUBLE);
            }

            if (accept_hoid != -1){
                
                pstmt.setInt(10, accept_hoid);                        
                pstmt.setString(11, officerPosition_List.get(officerID_List.indexOf(accept_hoid)));
                pstmt.setString(12, officerElectionDate_List.get(officerID_List.indexOf(accept_hoid)));
              
            } else if (original_accept_hoid != null){
                
                pstmt.setInt(10, original_accept_hoid);
                pstmt.setString(11, original_accept_position);
                pstmt.setString(12, original_accept_electiondate);
            } else{
                pstmt.setNull(10, Types.INTEGER);
                pstmt.setString(11, "");
                pstmt.setString(12, "");                
            }      
                
            if (return_date != null){
                pstmt.setString(13, return_date);                 
            }else if (original_return_date != null){
                pstmt.setString(13, original_return_date);
            } else{
                pstmt.setString(13, "");
            }
          
            pstmt.setInt(14, asset_id);
            pstmt.setString(15, rental_date);
            
            pstmt.executeUpdate();
            System.out.println("CHECK");

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
    
    
    
    

    
    
    
    
    
    
    
    
}
