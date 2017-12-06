/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author User
 */
public class Homestay 
{
    String houseID;
    String houseName;
    String address;
    String accomodation;
    int rate;
    
    public Homestay ()
    {
    
    }
    
    public Homestay(String houseID, String houseName, String address, String accomadation, int rate)
    {
        this.houseID = houseID;
        this.houseName = houseName;
        this.address = address;
        this.accomodation = accomodation;
        this.rate = rate;
    }
    
    public void sethouseID(String houseID)
    {
        this.houseID = houseID;
    }
    
    public String gethouseID()
    {
        return houseID;
    }
    
    public void sethouseName(String houseName)
    {
        this.houseName = houseName;
    }
    
    public String gethouseName()
    {
        return houseName;
    }
    
    public void setAddress(String address)
    {
        this.address = address;
    }
    
    public String getAddress()
    {
        return address;
    }
    
    public void setRate(int rate)
    {
        this.rate = rate;
    }
    
    public int getRate()
    {
        return rate;
    }
}
    
    
