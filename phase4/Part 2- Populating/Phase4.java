/* Team: Jenny Spicer & Kailey Bergeron */
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Phase4{
    public static void main (String[] args){
        try{
            //Create file
            FileWriter outfile = new FileWriter(String.format("%s.sql", args[0].toString()));
            //Read file; using args[0] we can get the argument that the user passed in in the command line
            File infile = new File(String.format("%s.txt", args[0]));
            Scanner input = new Scanner(infile);

            while(input.hasNextLine()){
                String line = input.nextLine();
                if(line.length()==0){
                    outfile.write("\n");
                }
                else{
                    //write out insert statements
                    outfile.write(processLine(line, args[0].toString()));
                }
                if(input.hasNextLine()){
                    outfile.write("\n");
                }
            }
            outfile.write("\ncommit;");
            outfile.close();
            input.close();
        }
        catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }//end main

    public static String processLine(String line, String file){
        ArrayList<String> cleanValues = new ArrayList<String>();
        String[] values = line.split(",");
        String output;
        String insertStatement;

        for(String value : values){
            cleanValues.add(value.trim());
        }
        
        //Determine data types
        ArrayList<String> datatypes = new ArrayList<String>();
        for(String value : cleanValues){
            try{
                Integer.parseInt(value);
                datatypes.add(value);
            }
            catch(NumberFormatException e){
                try{
                    Float.parseFloat(value);
                    datatypes.add(value);
                }
                catch(NumberFormatException f){
                    if(value.toLowerCase().equals("null")){
                        datatypes.add("NULL");
                    }
                    else{
                        if(value.contains("'") || value.contains("’")){
                            value = value.replace("'", "''");
                            value = value.replace("’", "''");//weird apostrophe
                        }
                        datatypes.add(String.format("'%s'", value));
                    }
                }
            }
        }

        output = String.join(",", datatypes);
        insertStatement = String.format("INSERT INTO %s VALUES(%s);", file, output);
        return insertStatement;
    }//end processLine()
}//end class