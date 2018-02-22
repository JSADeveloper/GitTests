/**
 * Created by joshuastigall on 2017-12-15.
 */

trigger WarrantySummary on Case (before insert) {



   for (Case myCase : Trigger.new) {

       // THIS IF STATEMENT ONLY CREATES THE WARRANTY SUMMARY, IF THE FIELDS ARE NOT NULL
       
       if (myCase.Product_Purchase_Date__c != null
               && myCase.Product_Total_Warranty_Days__c != null
               && myCase.Product_Has_Extended_Warranty__c != null) {


           String purchaseDate          = myCase.Product_Purchase_Date__c.format();
           String createdDate           = Datetime.now().format();
           Integer warrantyDays         = myCase.Product_Total_Warranty_Days__c.intValue();

           Decimal warrantyPercentage   = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today())
                   / myCase.Product_Total_Warranty_Days__c)).setScale(2);

           Boolean hasExtendedWarranty  = myCase.Product_Has_Extended_Warranty__c;

           myCase.Warranty_Summary__c   = 'Product purchased ' + purchaseDate
                   + ' and case created on ' + createdDate + '.\n'
                   + ' Warranty is for ' + warrantyDays
                   + ' days and is ' + warrantyPercentage + ' % through its warranty period.\n'
                   + ' Extended warranty: ' + hasExtendedWarranty + '.\n'
                   + ' Have a great day!';

       }







//
       //POPULATE SUMMARY FIELD ONLY IF PURCHASE DATE AND WARRANTY DAYS IS NOT NULL






   }

}

/*
   Product purchased on <<Purchase Date>> and case created on <<Case Created Date>>.
   Warranty is for <<Warranty Total Days>> days and is <<Warranty Percentage>>% through its warranty period.
   Extended warranty: <<Has Extended Warranty>>.
   Have a Great Day!

   ORIGINAL CODE THAT WORKS


   trigger WarrantySummary on Case (before insert) {


   for (Case myCase : Trigger.new) {

        String purchaseDate          = myCase.Product_Purchase_Date__c.format();
        String createdDate           = Datetime.now().format();
        Integer warrantyDays         = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage   = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today())
                                        / myCase.Product_Total_Warranty_Days__c)).setScale(2);
        Boolean hasExtendedWarranty  = myCase.Product_Has_Extended_Warranty__c;

           //POPULATE SUMMARY FIELD


           myCase.Warranty_Summary__c   = 'Product purchased ' + purchaseDate
                   + ' and case created on ' + createdDate + '.\n'
                   + ' Warranty is for ' + warrantyDays
                   + ' days and is ' + warrantyPercentage + ' % through its warranty period.\n'
                   + ' Extended warranty: ' + hasExtendedWarranty + '.\n'
                   + ' Have a great day!';

   }

}

// WITH NOTES

//SET UP VARIABLE FIELDS TO USE IN THE SUMMARY FIELD


           //ADDED format() METHOD TO CLEAN UP. THIS TURNS IT INTO A STRING
           //CHANGED FROM Date TO String BECAUSE OF format() METHOD. GOT ERROR 'ILLEGAL ASSIGNMENT FROM STRING TO DATE'

           //String purchaseDate          = myCase.Product_Purchase_Date__c.format();

           //CHANGED FROM myCase.CreatedDate; BECAUSE WAS NULL
           //ADDED format() METHOD TO CLEAN UP. THIS TURNS IT INTO A STRING
           //CHANGED FROM Date TO String BECAUSE OF format() METHOD. GOT ERROR 'ILLEGAL ASSIGNMENT FROM STRING TO DATE'

            //String createdDate           = Datetime.now().format();

           //intValue IS USED BECAUSE SALESFORCE IS READING warrantyDays AS A DECIMAL.
           //IT'S DEFINITELY NOT, BUT intValue TRANSFORMS THE 'DECIMAL' TO AN INTEGER.

//       Integer warrantyDays         = myCase.Product_Total_Warranty_Days__c.intValue();

           //WAS 0% WITH THIS CODE warrantyDays;

           //USING myCase.Product_TOTAL_WARRANTY. . . BECAUSE IT WAS A DECIMAL BEFORE intValue


       //Decimal warrantyPercentage   = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today())
                   /// myCase.Product_Total_Warranty_Days__c)).setScale(2);

           //MOVED OUTSIDE OF THE TRIGGER TO SEE IF THEY'RE AVAILABLE IN THE IF STATEMENT

       //Boolean hasExtendedWarranty  = myCase.Product_Has_Extended_Warranty__c;

           //POPULATE SUMMARY FIELD

    */