/* Team: Jenny Spicer & Kailey Bergeron */
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Phase6 {
    public static void main(String[] args) {
        HashMap<String, String> customerData = new HashMap<>();
        HashMap<String, String> addressData = new HashMap<>();
        HashMap<String, String> quantityData = new HashMap<>();
        // Read and process the files
        processDataFile("customer.txt", customerData);
        processDataFile("address.txt", addressData);
        processDataFile("lineitem.txt", quantityData);

        //Find customers with one or more address(es):
        ArrayList<String> names = findAddress(customerData, addressData);
        for(String name : names){
            System.out.println(name);
        }

        
        //Find the product IDs and quantities sold:
        HashMap<String, String> products = findQuantity(quantityData);
        for(Map.Entry<String, String> product : products.entrySet()){
            System.out.println(""+product.getKey() +"   "+ product.getValue());
        }
    }

    public static void processDataFile(String fileName, HashMap<String, String> data) {
        try {
            File file = new File(fileName);
            Scanner scanner = new Scanner(file);

            if(fileName.toLowerCase().equals("customer.txt")){
                //4 columns: custID, Name, DOB, referrer
                while (scanner.hasNextLine()) {
                    String line = scanner.nextLine();
                    String[] columns = line.split(",");
                    if (columns.length >= 4) {
                        String custID = columns[0].trim();
                        String custName = columns[1].trim();
                        String custDOB = columns[2].trim();
                        String custReferrer = columns[3].trim();
                        data.put(custID, custName);
                    }
                }
            }
            else if(fileName.toLowerCase().equals("address.txt")){
                //2 columns: custID, address
                while (scanner.hasNextLine()) {
                    String line = scanner.nextLine();
                    String[] columns = line.split(",");
                    if (columns.length >= 2) {
                        String A_custID = columns[0].trim();
                        String address = columns[1].trim();
                        data.put(A_custID, address);
                    }
                }
            }
            else if(fileName.toLowerCase().equals("lineitem.txt")){
                //3 columns: ordernumber, productID, quantity
                while (scanner.hasNextLine()) {
                    String line = scanner.nextLine();
                    String[] columns = line.split(",");
                    if (columns.length >= 3) {
                        String orderNumber = columns[0].trim();
                        String L_productID = columns[1].trim();
                        String L_quantity = columns[2].trim();
                        data.put(L_productID, L_quantity);
                    }
                }
            }

            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + fileName);
        }
    }

    // public static String findHighestPricedProduct(HashMap<String, String> productData) {
    //     double highestPrice = Double.MIN_VALUE;
    //     String highestPricedProduct = null;

    //     for (String productId : productData.keySet()) {
    //         String productInfo = productData.get(productId);
    //         String[] productInfoArray = productInfo.split(",");
    //         double productPrice = Double.parseDouble(productInfoArray[1]);

    //         if (productPrice > highestPrice) {
    //             highestPrice = productPrice;
    //             highestPricedProduct = productInfoArray[0];
    //         }
    //     }

    //     return highestPricedProduct;
    // }


    /*
    --1. Find the names of all customers who have at least one address-----DONE

    SELECT DISTINCT C_Name "Customers with 1+ address(es)"
    FROM Customer, Address --inner join
    WHERE C_ID = A_CustID;
    */
    public static ArrayList<String> findAddress(HashMap<String, String> customerData, HashMap<String, String> addressData) {
        //inner join customer and address with a double for-loop
            //check that custID = A_CustID, aka customerData and addressData keys are equal
            //if so, add custName to list of some sort
            
        //return custName list

        ArrayList<String> names = new ArrayList<>();

        for (String C_CustID : customerData.keySet()) {
            String custName = customerData.get(C_CustID);

            for (String A_CustID : addressData.keySet()) {
                String custAddress = addressData.get(C_CustID);
                
                if(C_CustID.equals(A_CustID)){
                    //customer has at least one address, so add name to list
                    names.add(custName);
                }
            }//end inner loop
        }//end outer loop
        return names;
    }

    /*
    --2. For each product id, list the total quantity sold-----DONE

    select L_ProductID, L_Quantity
    from LineItem
    group by L_ProductID, L_Quantity
    ORDER BY L_Quantity DESC;
    */
    public static HashMap<String, String> findQuantity(HashMap<String, String> quantityData) {
        HashMap<String, String> quantities = new HashMap<>();
        
        String oldAmount="0";
        for (String ID : quantityData.keySet()) {
            String amount = quantityData.get(ID);
            if (quantities.containsKey(ID)){
                String newAmount = ( Integer.parseInt(amount) + Integer.parseInt(oldAmount) )+"";
                quantities.put(ID, newAmount);
                oldAmount = quantityData.get(ID);
            }
            else if (!(quantities.containsKey(ID)) ){
                quantities.put(ID, amount);
            }
        }
        return quantities;
    }
}