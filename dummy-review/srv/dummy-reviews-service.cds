namespace sap.capire.reviews;
using { sap.capire.reviews as my } from '../db/schema';

service ReviewsService {
  event reviewed : { subject:String; rating: Decimal(2,1) };
  event positiveReviewCreated : { reviewer:String; subject:String; rating: Integer; date: DateTime };
  event reviewCreated : { reviewer:String; subject:String; rating: Integer; date: DateTime  };
  
  // API
  entity Reviews as projection on my.Reviews excluding { likes }
  action like (review:Reviews.ID);
  action unlike (review:Reviews.ID);  

  // Input validation
  annotate Reviews with {
    subject  @mandatory;
    title    @mandatory;
    rating   @mandatory @assert.enum;
  }

  // Auto-fill reviewers and review dates
  annotate Reviews with {
    reviewer @cds.on.insert:$user;
    date     @cds.on.insert:$now;
    date     @cds.on.update:$now;
  }
}