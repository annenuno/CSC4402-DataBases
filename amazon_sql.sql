/* Amazon Online Store select and update SQL statements */


/* 1) Get item ID such that the store receives the item by more than 2 vendors. */ 
      select I_ID 
      from (select I_ID, count(V_ID) as num from Inventory group by V_ID) as y
      where num > 2;

/* UPDATE #1: update vendor name with vendor ID V002 */
      update Vendor
      set V_Name = 'Tiger Farms'
      where V_ID = 'V002';

/* 2) Get item ID and item name with price greater than 1 and provided by vendor located in Baton Rouge. */
      Select I_ID, I_Name 
      from Inventory join Item using(I_ID) join Vendor using(V_ID)
      where V_City = 'Baton Rouge' and Price > 1;

/* 3) Get ID, name and phone number of all the drivers who work for vendors located in New Orleans. */
      select D_ID, D_Name, D_PNum 
      from Driver join Vendor using(V_ID)
      where V_City = 'New Orleans';

/* UPDATE #2: update item prices by increasing prices 5% */
      update Item
      set Price = Price * 1.05
      where Price > 0;

/* UPDATE #3: update vendor ID in Driver table */
      update Driver
      set V_ID = 'V004'
      where V_ID = 'V002';

/* 4) List all the vendor IDs, names and phone numbers such that the vendor is located in Baton Rouge. */
      select V_ID, V_Name, V_PNum
      from Vendor
      where V_City = 'Baton Rouge';

/* UPDATE #4: update vendor ID where representative ID is R013 */
      update Rep
      set V_ID = 'V009'
      where R_ID = 'R013';

/* UPDATE #5: update item prices that are greater than $5 */
      update Item
      set Price = Price - 2.25
      where Price >= 5;

/* 5) List all the representative IDs, names, phone numbers who works for vendor with vendor ID V009. */
      select R_ID, R_Name, R_PNum
      from Rep 
      where V_ID = 'V009';

/* 6) Get all the item names that has a price of more than 2. */
      select I_Name
      from Item
      where Price > 2;

/* 7) List all the driver ID, name and phone number such that the driver works for a vendor located in Baton Rouge. */
      select D_ID, D_Name, D_PNum
      from Driver join Vendor using(V_ID) 
      where V_City = 'Baton Rouge';
