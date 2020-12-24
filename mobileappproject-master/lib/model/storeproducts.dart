class StoreProducts
{
  String documentId;
  String itemName;
  double itemPrice;
  String imageUrl;
DateTime lastUpdatedAt;
String itemDescription;
String addedBy;
List<dynamic>sharedWith;
String review;
  StoreProducts(
    {
    
      this.itemName,
      this.itemPrice,
      this.imageUrl,
      this.lastUpdatedAt,
      this.itemDescription,
      this.addedBy,
      this.sharedWith,
      this.review
    
    });
    StoreProducts.empty()
    {

      this.itemName='';
      this.itemPrice=0;
      this.imageUrl='';
      this.itemDescription='';
      this.addedBy='';
      this.sharedWith=<dynamic>[];
      this.review='';
     }
    // StoreProducts.clone(StoreProducts b)
    // {
    //   this.documentId=b.documentId;
    //   this.imageUrl=b.imageUrl;
    //   this.itemDescription=b.itemDescription;
    //   this.itemName=b.itemName;
    //   this.itemPrice=b.itemPrice;
    // this.lastUpdatedAt=b.lastUpdatedAt;
    // this.addedBy=this.addedBy;
    // this.sharedWith=<dynamic>[]..addAll(b.sharedWith);
    // }
    Map<String,dynamic> serialize()
    {
      return <String,dynamic>
      {
ITEMNAME :itemName,
ITEMDESCRIPTION:itemDescription,
ITEMPRICE:itemPrice,
IMAGEURL:imageUrl,
LASTUPDATEDAT:lastUpdatedAt,
ADDEDBY:addedBy,
SHAREDWITH:sharedWith,
REVIEW:review,
      };
    }
static StoreProducts deserialize(Map<String,dynamic> data,String docId)
{
  var storeProducts=StoreProducts(
    imageUrl: data[StoreProducts.IMAGEURL],
    itemName: data[StoreProducts.ITEMNAME],
    itemDescription: data[StoreProducts.ITEMDESCRIPTION],
    itemPrice: data[StoreProducts.ITEMPRICE],
    addedBy: data[StoreProducts.ADDEDBY],
    sharedWith:data[StoreProducts.SHAREDWITH],
    review:data[StoreProducts.REVIEW]
,
  );
  if(data[StoreProducts.LASTUPDATEDAT] != null)
  {
    storeProducts.lastUpdatedAt=DateTime.fromMillisecondsSinceEpoch(
      data[StoreProducts.LASTUPDATEDAT].millisecondsSinceEpoch);
  }
  storeProducts.documentId=docId;
  return storeProducts;
}
static const PRODUCTCOLLECTION='products';
static const ITEMIMAGE='itemImage';
static const ITEMNAME='itemName';
static const ITEMPRICE='itemPrice';
static const IMAGEURL='imageUrl';  
static const ITEMDESCRIPTION='itemDescription'; 
static const LASTUPDATEDAT='lastUpdatedAt';
static const ADDEDBY='addedBy';
static const SHAREDWITH='sharedWith';
static const REVIEW='review';
}