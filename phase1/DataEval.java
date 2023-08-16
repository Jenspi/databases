/* Team: Jenny Spicer & Kailey Bergeron */
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class DataEval{
    public static void main (String[] args){
        try{
            //Create file
            FileWriter outfile = new FileWriter("UFOResults.csv");
            
            //Read input
            File infile = new File("phase1_fall2023-1.txt");
            Scanner input = new Scanner(infile);
            while(input.hasNextLine()){
                String line = input.nextLine();
                if(line.length()==0){
                    outfile.write("\n");
                }
                else{
                    outfile.write(processLine(line));
                }
                //Add newline character to keep original row formatting
                outfile.write("\n");
            }

            outfile.close();
            input.close();
        }
        catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }//end main

    public static String processLine(String line){
        ArrayList<String> cleanValues = new ArrayList<String>();
        String[] values = line.split(",");
        String output;

        for(String value : values){
            cleanValues.add(value.trim());
        }
        
        //Determine data types
        ArrayList<String> datatypes = new ArrayList<String>();
        for(String value : cleanValues){
            try{
                Integer.parseInt(value);
                datatypes.add("Integer");
            }
            catch(NumberFormatException e){
                try{
                    Float.parseFloat(value);
                    datatypes.add("Float");
                }
                catch(NumberFormatException f){
                    datatypes.add("String");

                }
            }
        }

        output = String.join(",", datatypes);
        return output;
    }
}//end class