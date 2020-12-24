
class Reviews

{
  String myReviews;
  String documentId;
Reviews({
 // this.documentId,
  this.myReviews,

});
Reviews.empty()
{
  //this.documentId='';
  this.myReviews='';
}
 Map<String,dynamic> serialize()
    {
      return <String,dynamic>
      {
//DOCUMENTID:documentId,
MYREVIEWS:myReviews,

      };
    }
    static Reviews deserialize(Map<String,dynamic>data,String docId)
    {
      var reviews=Reviews(
        myReviews: data[Reviews.MYREVIEWS],
      );
      reviews.documentId=docId;
      return reviews;
    }
    static const REVIEWSCOLLECTION='reviews';
//static const DOCUMENTID='documentId';
static const MYREVIEWS='myReviews';
}