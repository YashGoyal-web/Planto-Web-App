package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.Part;

public class DbConnect {
    private Connection c;
    public DbConnect() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
	c=DriverManager.getConnection("jdbc:mysql://localhost/plantodb","root", "Yash@123");
    }
    public String getAdminLogin(String id , String pass) throws Exception{
        PreparedStatement p = c.prepareStatement("Select name from admin where aid=? and password=?"); 
        p.setString(1, id);
        p.setString(2, pass);
        ResultSet rs = p.executeQuery();   
        if(rs.next()){
            return rs.getString("name");
        }else{
            return null;
        }    
    }
    
    public boolean addPlant(HashMap<String,Object> map) throws Exception{
        
        PreparedStatement ps = c.prepareStatement("select name from plants where name=?");
        ps.setString(1, (String)map.get("name"));
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            return false;
        }else{
            ps.close();
            ps = c.prepareStatement("insert into plants (name,price,description,category,height,photo,photo1,photo2,quantity) values (?,?,?,?,?,?,?,?,?) ");

            ps.setString(1, (String)map.get("name"));
            ps.setInt(2, (Integer)(map.get("price")));
            ps.setString(3, (String)(map.get("description")));
            ps.setString(4, (String)(map.get("category")));
            ps.setDouble(5, (Double)(map.get("height")));
            ps.setInt(9, (Integer)(map.get("quantity")));
            ps.setBinaryStream(6, (InputStream)(map.get("photo")));
            ps.setBinaryStream(7, (InputStream)(map.get("photo1")));
            ps.setBinaryStream(8, (InputStream)(map.get("photo2")));
            ps.executeUpdate();
            return true;
        }
    }
    
    public ArrayList<HashMap> getAllPlant() throws Exception{
        ArrayList<HashMap> al = new ArrayList();
        PreparedStatement ps = c.prepareStatement("select * from plants");
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            HashMap<String,Object> map = new HashMap();
            map.put("plant_id", rs.getInt("plant_id"));
            map.put("name", rs.getString("name"));
            map.put("price", rs.getInt("price"));
            map.put("height", rs.getDouble("height"));
            al.add(map);
        }
        return al;
    }
    
    public HashMap<String,Object> getPlantById(int plant_id) throws Exception{
        ArrayList<HashMap> al = new ArrayList();
        PreparedStatement ps = c.prepareStatement("select * from plants where plant_id = "+plant_id);
        ResultSet rs = ps.executeQuery();
        HashMap<String,Object> map = null;
        if(rs.next()){
            map = new HashMap();
            map.put("plant_id", rs.getInt("plant_id"));
            map.put("name", rs.getString("name"));
            map.put("price", rs.getInt("price"));
            map.put("height", rs.getDouble("height"));
            map.put("description", rs.getString("description"));
            map.put("category", rs.getString("category"));
            map.put("quantity", rs.getInt("quantity"));
            al.add(map);
        }
        return map;
    }
    
    public byte[] getPhoto(int plant_id , int photo_no) throws Exception{
        
        PreparedStatement ps = null;
        if(photo_no == 1)
        ps = c.prepareStatement("select photo from plants where plant_id = "+plant_id);
        else if(photo_no == 2)
        ps = c.prepareStatement("select photo1 from plants where plant_id = "+plant_id);
        else if(photo_no == 3)
        ps = c.prepareStatement("select photo2 from plants where plant_id = "+plant_id);
        byte[] image=null;
        ResultSet rs = ps.executeQuery();
        if(rs.next()) image = rs.getBytes(1);
        return image;
    }
    
    public boolean deletePlant(int plant_id) throws Exception{
        
        PreparedStatement ps = c.prepareStatement("delete from plants where plant_id = "+plant_id);
        int res = ps.executeUpdate();
        
        if(res!=0)return true;
        return false;
        
    }
    
    public boolean createAccount(HashMap<String,String> user) throws Exception{
        
        String name = user.get("name");
        String email = user.get("email");
        String password = user.get("password");
        String phone = user.get("phone");
        PreparedStatement ps = c.prepareStatement("insert into users (name,email,password,phone) values (?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, phone);
        try{
            ps.executeUpdate();
            return true;
        }catch(java.sql.SQLIntegrityConstraintViolationException ex){
            return false;
        }
    }
    
    public String getUserLogin(String email , String password) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from users where email=? and password=?");
        ps.setString(1,email);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            return rs.getString("name");
        }else{
            return null; 
        }
    }
    
    public ArrayList<HashMap<String,Object>> getPlantsLikeName(String name) throws Exception{
        ArrayList<HashMap<String,Object>> plants  = new ArrayList<HashMap<String,Object>>();
        PreparedStatement ps = c.prepareStatement("select * from plants where name like ?");
        ps.setString(1, "%"+name+"%");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            HashMap<String,Object> plant = new HashMap<String,Object>();
            plant.put("name",rs.getString("name"));
            plant.put("plant_id",rs.getInt("plant_id"));
            plant.put("price",rs.getInt("price"));
            plant.put("category",rs.getString("category"));
            plant.put("quantity",rs.getInt("quantity"));
            plant.put("description",rs.getString("description"));
            plant.put("height",rs.getDouble("height"));
            plants.add(plant);
        }
        return plants;
    }
    
    public boolean updatePlant(HashMap<String,Object> map) throws Exception{
        
        PreparedStatement ps = null;
        
        int plant_id = (Integer)map.get("plant_id");
        String name = (String)map.get("name");
        int price = (Integer)map.get("price");
        String description = (String)map.get("description");
        String category = (String)map.get("category");
        double height = (Double)map.get("height");
        int quantity = (Integer)map.get("quantity");
        InputStream s1 = (InputStream)map.get("photo");
        InputStream s2 = (InputStream)map.get("photo1");
        InputStream s3 = (InputStream)map.get("photo2");
        
            ps = c.prepareStatement("update plants set name=?, price=?, category=?, height=? , description=? ,quantity=?  where plant_id=?");
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setString(3, category);
            ps.setDouble(4, height);
            ps.setString(5, description);
            ps.setInt(6, quantity);
            ps.setInt(7, plant_id);
            ps.executeUpdate();
            ps.close();
            if(s1!=null){
                ps = c.prepareStatement("update plants set photo = ? where plant_id=?");
                ps.setBinaryStream(1,s1);
                ps.setInt(2, plant_id);
                ps.executeUpdate();
                ps.close();
            }
            if(s2!=null){
                ps = c.prepareStatement("update plants set photo1 = ? where plant_id=?");
                ps.setBinaryStream(1,s2);
                ps.setInt(2, plant_id);
                ps.executeUpdate();
                ps.close();
            }
            if(s3!=null){
                ps = c.prepareStatement("update plants set photo2 = ? where plant_id=?");
                ps.setBinaryStream(1,s3);
                ps.setInt(2, plant_id);
                ps.executeUpdate();
                ps.close();
            } 
            return true;
    }

    public int getCartCount(String email) throws Exception{
        int count=0;
        PreparedStatement ps = c.prepareStatement("Select * from cart where email=?");
        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        while(rs.next())  {
            count+=rs.getInt("quantity");
        }
        return count;
    }
    
    public ArrayList<HashMap<String,Object>> getCartByEmail(String email) throws Exception{
        ArrayList<HashMap<String,Object>> plants  = new ArrayList<HashMap<String,Object>>();
        PreparedStatement ps = c.prepareStatement("select * from cart where email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            HashMap<String,Object> plant = new HashMap<String,Object>();
            plant.put("plant_id", rs.getInt("plant_id"));
            plant.put("cart_id", rs.getInt("cart_id"));
            plant.put("quantity", rs.getInt("quantity"));
            plants.add(plant);
        }
        return plants;
    }
    
    public boolean addToCart(String email , int plant_id) throws Exception{
        
        PreparedStatement ps = c.prepareStatement("select * from plants where plant_id = "+plant_id+" and quantity>0");
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            ps.close();
            ps = c.prepareStatement("select cart_id from cart where plant_id=? and email=?");
            ps.setInt(1, plant_id);
            ps.setString(2,email);
            ResultSet rs2 = ps.executeQuery();
            if(rs2.next()){
                ps.close();
                ps = c.prepareStatement("update cart set quantity = quantity+1 where plant_id='"+plant_id+"' and email='"+email+"'");
                ps.executeUpdate();
                return true;
            }else{
                ps.close();
                ps = c.prepareStatement("insert into cart (plant_id,email,quantity) values(?,?,?)");
                ps.setInt(1,plant_id);
                ps.setString(2,email);
                ps.setInt(3,1);
                ps.executeUpdate();
                return true;
            }
        }else{
            return false;
        }
    }
    
    public boolean updateQuantityInCart(String email , int plant_id , int num) throws Exception{
        PreparedStatement ps = c.prepareStatement("update cart set quantity="+num+" where email='"+email+"' and plant_id='"+plant_id+"'");
        int result = ps.executeUpdate();
        if(result>0) return true;
        else return false;
    }
    
    public boolean deleteFromCart(String email , int plant_id ) throws Exception{
        PreparedStatement ps = c.prepareStatement("delete from cart where email='"+email+"' and plant_id='"+plant_id+"'");
        int result = ps.executeUpdate();
        if(result>0) return true;
        else return false;
    }
    
    public int getQuantityOfPlantInCart(int plant_id , String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from cart where email='"+email+"' and plant_id="+plant_id+"");
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            return rs.getInt("quantity");
        }else{
            return 0;
        }
    }
    
    public ArrayList<String> getAdress(String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from user_address where email='"+email+"'");
        ResultSet rs = ps.executeQuery();
        ArrayList<String> addresses = new ArrayList<>();
        while(rs.next()){
            addresses.add(rs.getString("address"));
        }
        return addresses;        
    }
    
    public boolean setAdress(String email , String address) throws Exception{
        PreparedStatement ps = c.prepareStatement("insert into user_address (email,address) values (?,?)");
        ps.setString(1, email);
        ps.setString(2, address);
        ps.executeUpdate();
        return true;
    }
    
    public ArrayList getQtyNameFromPlants(int plant_id) throws Exception{
        PreparedStatement ps = c.prepareStatement("select name,quantity from plants where plant_id = ?");
        ps.setInt(1, plant_id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            ArrayList al = new ArrayList();
            al.add(rs.getString("name"));
            al.add(rs.getInt("quantity"));
            return al;
        }
        return null;
    }
    
    public int setOrder(String email , String address) throws Exception{
        PreparedStatement ps = c.prepareStatement("insert into orders (email,order_datetime,address,status) values (?,CURRENT_TIMESTAMP,?,'Pending') ");
        ps.setString(1,email);
        ps.setString(2,address);
        ps.executeUpdate();
        ps.close();
        ps = c.prepareStatement("select max(order_id),min(order_id) from orders");
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }
    
    public void updateOrderList(ArrayList<HashMap<String,Object>> cartPlants , int order_id ) throws Exception{
        
        PreparedStatement ps = c.prepareStatement("insert into order_items values (?,?,?,?,?,?)");
        PreparedStatement ps2 = c.prepareStatement("select * from plants where plant_id=?");
        
        for( HashMap<String,Object> cartPlant : cartPlants ){
            int plant_id = (Integer)(cartPlant.get("plant_id"));
            ps2.setInt(1, plant_id);
            ResultSet rs = ps2.executeQuery();
            if(rs.next()){
                ps.setInt(1, order_id);
                ps.setString(2, rs.getString("name"));
                ps.setInt(3, rs.getInt("price"));
                ps.setInt(4, (Integer)cartPlant.get("quantity"));
                ps.setString(5, rs.getString("category"));
                ps.setBinaryStream(6, rs.getBinaryStream("photo"));
                ps.executeUpdate();
            }
        }
    }
    
    public void deleteFromCart(String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("delete from cart where email=?");
        ps.setString(1,email);
        ps.executeUpdate();
    }
    
    public void UpdateQtyFromPlant(ArrayList<HashMap<String,Object>> cartPlants) throws Exception{
        
        for(HashMap<String,Object> cartPlant : cartPlants){
            PreparedStatement ps = c.prepareStatement("update plants set quantity=quantity-? where plant_id=?");
            ps.setInt(1,(Integer)cartPlant.get("quantity"));
            ps.setInt(2,(Integer)cartPlant.get("plant_id"));
            ps.executeUpdate();
        }
    }
    
    public ArrayList<HashMap<String,Object>> getOrders(String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from orders where email=? order by order_datetime desc");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        ArrayList<HashMap<String,Object>> allOrders = new ArrayList<HashMap<String,Object>>();
        while(rs.next()){
            HashMap<String,Object> order = new HashMap<String,Object>();
            order.put("order_id", rs.getInt("order_id"));
            order.put("order_datetime", rs.getString("order_datetime"));
            order.put("address", rs.getString("address"));
            order.put("status", rs.getString("status"));
            allOrders.add(order);
        }
        return allOrders;
    }
    
    public ArrayList<HashMap<String,Object>> getOrderItem(int order_id ) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from order_items where order_id=?");
        ps.setInt(1,order_id);
        ArrayList<HashMap<String,Object>> order_items = new ArrayList<HashMap<String,Object>>(); 
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            HashMap<String,Object> order_item = new HashMap<String,Object>();
            order_item.put("order_id", rs.getInt("order_id"));
            order_item.put("name", rs.getString("name"));
            order_item.put("price", rs.getInt("price"));
            order_item.put("quantity", rs.getInt("quantity"));
            order_item.put("category", rs.getString("category"));
            order_items.add(order_item);
        }
        return order_items;
    }
    
    public byte[] getOrderItemPhoto(String name , int order_id) throws Exception{
        
        PreparedStatement p=c.prepareStatement("select photo from order_items where name=? and order_id=?");
		p.setString(1, name);
		p.setInt(2, order_id);
		ResultSet rs=p.executeQuery();
		byte []photo=null;
		if(rs.next()) {
			photo=rs.getBytes(1);
		}
		return photo;
    }
    
    public int getOrderPrice(int order_id) throws Exception{
        PreparedStatement ps = c.prepareStatement("select * from order_items where order_id=?");
        ps.setInt(1,order_id);
        ResultSet rs = ps.executeQuery();
        int total = 0;
        while(rs.next()){
            total+=rs.getInt("price")*rs.getInt("quantity");
        }
        return total;
    }
    
    public void deleteOrder(int order_id , String name) throws Exception{
        
        PreparedStatement ps = c.prepareStatement("select quantity from order_items where order_id=? and name=?");
        ps.setInt(1, order_id);
        ps.setString(2, name);
        ResultSet rs = ps.executeQuery();
        PreparedStatement ps1 = c.prepareStatement("update plants set quantity = quantity+? where name=?");
        rs.next();
        ps1.setInt(1,rs.getInt(1));
        ps1.setString(2,name);
        ps1.executeUpdate();
        
        PreparedStatement ps2 = c.prepareStatement("Update orders set status='Canceled' where order_id=?");
        ps2.setInt(1,order_id);
        ps2.executeUpdate();
    }
    
    public ArrayList<HashMap<String,Object>> getAllOrdersByAdmin(String status) throws Exception{
        ArrayList<HashMap<String,Object>> al = new ArrayList();
        PreparedStatement ps = c.prepareStatement("select * from orders where status=? order by order_datetime desc");
        ps.setString(1,status);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            HashMap<String,Object> map = new HashMap<String,Object>();
            map.put("order_id", rs.getInt("order_id"));
            map.put("email", rs.getString("email"));
            map.put("order_datetime", rs.getString("order_datetime"));
            map.put("address", rs.getString("address"));
            map.put("status", rs.getString("status"));
            al.add(map);
        }
        return al;
    }
    
    public void updateOrderStatus(int order_id , String status) throws Exception{
        PreparedStatement ps = c.prepareStatement("update orders set status=? where order_id=?");
        ps.setString(1,status);
        ps.setInt(2,order_id);
        ps.executeUpdate();
    }
    
    public String getPassword(String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("select password from users where email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) return rs.getString(1);
        return null;
    }
    
    public String chagePassword(String email , String oldPassword , String newPassword) throws Exception{
        PreparedStatement ps = c.prepareStatement("update users set password = ? where email=? and password=?");
        ps.setString(1, newPassword);
        ps.setString(2, email);
        ps.setString(3, oldPassword);
        int a = ps.executeUpdate();
        if(a!=0)return "Password Changed Successfully .. ";
        else return "Old Password Is Wrong .. ";
    }
    
    public String updateProfile(String name , String phone , String email) throws Exception{
        PreparedStatement ps = c.prepareStatement("update users set name=? , phone=? where email=?");
        ps.setString(1, name);
        ps.setString(2, phone);
        ps.setString(3, email);
        ps.executeUpdate();
        return "Profile Update Successfully .. ";
    };
    
    public String getPhoneNum(String email) throws Exception{
        PreparedStatement p = c.prepareStatement("Select phone from users where email=?"); 
        p.setString(1, email);
        ResultSet rs = p.executeQuery();   
        if(rs.next()){
            return rs.getString("phone");
        }else{
            return null;
        }    
    }
    
}