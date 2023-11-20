import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.ResultSetMetaData;

public class Phase9 {
    public static void main(String[] args) {
        String id = args[0].trim();
        String date = args[1];
        //FOR DEBUGGING:
        // String id="";
        // String id = "C04";
        // String date = "03-feb-23";
        String username = "";
        String password = "";
        try{
            //Connect to Oracle DBMS
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle21c", username, password);
            Statement state = conn.createStatement();
            
            String queryString = "SELECT P_Price, L_Quantity, P_Name, C_Name, C_ID, O_OrderDate FROM Customer JOIN Orders ON (C_ID = O_CustID) JOIN LineItem ON (O_OrderNumber = L_OrderNumber) JOIN Product ON (L_ProductID = P_ID) WHERE (C_ID = ?) AND (O_OrderDate = ?) ";
            PreparedStatement queryPrepared = conn.prepareStatement(queryString);
            
            queryPrepared.setString(1, id);
            queryPrepared.setString(2, date);

            ResultSet orderInvoice = queryPrepared.executeQuery();

            while(orderInvoice.next()){
                String customerID = orderInvoice.getString("C_ID").trim();
                Date orderDate = orderInvoice.getDate("O_OrderDate");
                String orderDateToStr = new SimpleDateFormat("dd-MMM-yy").format(orderDate);
                

                if(orderDateToStr.toLowerCase().equals(date.toLowerCase()) && customerID.toLowerCase().equals(id.toLowerCase())){
                    double shipping_cost=0;
                    double total_cost=0;

                    String customerName = orderInvoice.getString("C_Name");
                    System.out.printf("\n%s invoice for %s : %s\n\n", orderDateToStr.toUpperCase(), customerID, customerName);
                    
                    // decorating :)
                    // Right padding: %1$-   ; Left padding: %1$
                    String header = String.format("%1$-20s %2$5s %3$5s %4$10s\n", "Product", "Quantity", "Price/Unit", "Total");
                    System.out.printf(header);
                    char divider = '-';
                    int length = header.length();
                    String line = String.format("%1$"+length+"s\n", divider).replace(' ', divider);
                    System.out.print(line);

                    do{
                        double productPrice = orderInvoice.getDouble("P_Price");
                        int itemQuantity = orderInvoice.getInt("L_Quantity");
                        String productName = orderInvoice.getString("P_Name");
                        
                        double product_cost=(productPrice*itemQuantity);
                        total_cost += product_cost;

                        System.out.printf("%1$-20s %2$9d %3$9.2f$ %4$10.2f$\n",productName, itemQuantity, productPrice, product_cost);
                    }while(orderInvoice.next());

                    if(total_cost < 35.00){ shipping_cost=10.00; }
                    System.out.printf("\nTotal Product Cost   :    $%.2f\nShipping Cost        :    $%.2f\nTotal Due            :    $%.2f\n", total_cost, shipping_cost, (total_cost+shipping_cost));
                    
                    //exit program to avoid hitting "No invoice found" message
                    return;
                }
            }
        
            System.out.println("No invoice to generate!");

            conn.close();
        } catch(Exception e){
            System.out.println(e);
        }
    }//end main
}//end class