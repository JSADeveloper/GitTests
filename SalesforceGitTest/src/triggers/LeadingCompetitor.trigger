/**
 * Created by joshuastigall on 2017-12-20.
 */

trigger LeadingCompetitor on Opportunity (before insert, before update ) {

    for (Opportunity opp : Trigger.new) {

        // ADD ALL PRICES TO A LIST IN ORDER OF COMPETITOR
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);

        // ADD ALL COMPETITORS IN A LIST IN ORDER
        List<String> competitors = new List<String>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);

// LOOP THROUGH ALL COMPETITORS TO FIND THE POSITION OF THE LOWEST PRICE
        //BOTH VARIABLES BELOW SO THAT IT'S SCOPE IS NOT LIMITED TO ONE ITERATION
//        Decimal lowestPrice; //USED TO TRACK LOWEST PRICE.
//        Integer lowestPricePosition; //USED TO TRACK POSITION OF LOWEST PRICE IN LIST
//
//        for (Integer i = 0; i < competitorPrices.size(); i++) {
//            // THE VARIABLE currentPrice IS USED SO THAT competitorPrices.get(i) DOESN'T NEED TO BE USED MULTIPLE TIMES.
//            Decimal currentPrice = competitorPrices.get(i);
//            if(lowestPrice == null || currentPrice < lowestPrice) {
//                lowestPrice = currentPrice;
//                lowestPricePosition = i;
//            }
//
//        }

        // FOR CHALLENGE TO POPULATE Leading_Competitor WITH HIGHEST PRICE

        Decimal highestPrice; //USED TO TRACK HIGHEST PRICE.
        Integer highestPricePosition; //USED TO TRACK POSITION OF HIGHEST PRICE IN LIST

        for (Integer i = 0; i < competitorPrices.size(); i++) {
            // THE VARIABLE currentPrice IS USED SO THAT competitorPrices.get(i) DOESN'T NEED TO BE USED MULTIPLE TIMES.
            Decimal currentPrice = competitorPrices.get(i);
            if(highestPrice == null || currentPrice > highestPrice) {
                highestPrice            = currentPrice.intValue();
                highestPricePosition    = i;
            }

        }


        //  SET LEADING COMPETITOR FIELD TO THE COMPETITOR WITH HIGHEST PRICE
        opp.Leading_Competitor__c       = competitors.get(highestPricePosition);

        // THE LINE BELOW IS COMPILING IN THE CODE BUT NOT UPDATING THE FIELD.
        // LeadingCompetitor: execution of BeforeUpdate caused by: System.ListException: List index out of bounds: 6773 Trigger.LeadingCompetitor: line 56, column 1
        //opp.Leading_Competitor_Price__c = competitorPrices.get(highestPrice.intValue());

    }

}