/* Team: Jenny Spicer & Kailey Bergeron */
/* Code by Kailey for this phase */
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;

public class Phase5 {
    public static void main(String[] args) {
        HashMap<String, String> productData = new HashMap<>();
        // Read and process the product file
        processDataFile("product.txt", productData);

        // Find the product with the highest price
        String highestPricedProduct = findHighestPricedProduct(productData);

        if (highestPricedProduct != null) {
            System.out.println("Product with the highest price: " + highestPricedProduct);
        } else {
            System.out.println("No products found.");
        }
    }

    public static void processDataFile(String fileName, HashMap<String, String> data) {
        try {
            File file = new File(fileName);
            Scanner scanner = new Scanner(file);

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] columns = line.split(",");
                if (columns.length >= 3) {
                    String productId = columns[0].trim();
                    String productName = columns[1].trim();
                    double productPrice = Double.parseDouble(columns[2].trim());
                    data.put(productId, productName + "," + productPrice);
                }
            }

            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + fileName);
        }
    }

    public static String findHighestPricedProduct(HashMap<String, String> productData) {
        double highestPrice = Double.MIN_VALUE;
        String highestPricedProduct = null;

        for (String productId : productData.keySet()) {
            String productInfo = productData.get(productId);
            String[] productInfoArray = productInfo.split(",");
            double productPrice = Double.parseDouble(productInfoArray[1]);

            if (productPrice > highestPrice) {
                highestPrice = productPrice;
                highestPricedProduct = productInfoArray[0];
            }
        }

        return highestPricedProduct;
    }
}
