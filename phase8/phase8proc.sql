--ALTER TABLE Product ADD Inventory NUMBER DEFAULT 64;
CREATE OR REPLACE PROCEDURE Invoice (custID Customer.C_ID%type, orderDate date)
AS
    -- Step 1/5 of a cursor: Declare variables to store values
        custName Customer.C_Name%type;
        total NUMBER;
        prodname Product.P_Name%type;
        L_quant LineItem.L_Quantity%type;
        prodPrice Product.P_Price%type;
        order_total NUMBER := 0;
        shipping number := 0;
        final_total NUMBER := 0;
        
    -- Step 2/5 of a cursor: Declare the cursor containing a query.
        CURSOR OrderInvoice IS (
                SELECT P_Price, L_Quantity, P_Name, C_Name
                FROM Customer 
                JOIN Orders ON C_ID = O_CustID
                JOIN LineItem ON O_OrderNumber = L_OrderNumber
                JOIN Product ON L_ProductID = P_ID
                WHERE C_ID = custID
                AND O_OrderDate = orderDate);
    BEGIN
        -- Step 3/5 of a cursor: Open the cursor
        IF OrderInvoice %ISOPEN THEN CLOSE OrderInvoice;
        END IF;
        OPEN OrderInvoice;
        
        dbms_output.put_line('call Invoice('''||custID||''', '''||orderDate||''');'||chr(10));
        
        -- Step 4/5 of a cursor: Fetch rows from the cursor (and do something with them...)
        FETCH OrderInvoice INTO prodprice, L_Quant, prodname, custname;
        IF (OrderInvoice%notfound) THEN DBMS_OUTPUT.PUT_LINE(LPAD(chr(32),5)||'No invoice to generate.'||chr(10)||chr(10));
        ELSE
            DBMS_OUTPUT.PUT_LINE(LPAD(chr(32),5)||orderDate||' invoice for '||custid||': '||custname||chr(10));
            DBMS_OUTPUT.PUT_LINE(RPAD(LPAD(chr(32),5)||'PRODUCT',25)||LPAD('QUANTITY',10)||LPAD('PRICE/UNIT',15)||LPAD('TOTAL ',13));
            dbms_output.put_line(LPAD(chr(32),5)||'---------------------------------------------------------------------------------------');
            
            loop
            
                
                exit when OrderInvoice%notfound;
                total := L_Quant * prodprice;
                order_total := order_total + total;
                
                DBMS_OUTPUT.PUT_LINE(LPAD(chr(32),5)||RPAD(prodname, 20)||LPAD(L_Quant, 10)||'    $ '||LPAD(prodprice,9)||'    $'||LPAD(TOTAL,7));--couldnt figure out how to align on decimals or cast to decimal in the same statement
                --SELECT LPAD('$' || TO_CHAR(5, '9999.99'), 10) AS "Cost" FROM Dual;
                
                FETCH OrderInvoice INTO prodprice, L_Quant, prodname, custname;
            end loop;
        
            if(order_total >= 35) then
                    shipping := 0;
                else
                    shipping := 10;
            end if;
            final_total := (shipping+order_total);
            DBMS_OUTPUT.PUT_LINE(chr(10)||LPAD(chr(32),5)||'Total Product Cost: '||LPAD('$ ',5)||LPAD(order_total, 6));
            DBMS_OUTPUT.PUT_LINE(LPAD(chr(32),5)||'Shipping Cost: '||LPAD('$ ',10)||LPAD(shipping,6));
            DBMS_OUTPUT.PUT_LINE(LPAD(chr(32),5)||'Total Due: '||LPAD('$ ',15)||LPAD(final_total,6)||chr(10)||chr(10)||chr(10));
        end if;
-- Step 5/5 of a cursor: Close the cursor
CLOSE OrderInvoice;
END;
/
    
call Invoice('C01', '30-JAN-23');
call Invoice('C07', '30-JAN-23');
call Invoice('C04', '30-JAN-23');
call Invoice('C08', '30-JAN-23');