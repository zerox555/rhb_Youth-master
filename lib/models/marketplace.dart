class MarketPlace{

 List<String> listingId;

 MarketPlace(this.listingId);

 Map<String, dynamic> toJson() =>{
  'listingId': listingId};

 static MarketPlace fromJson(Map<String, dynamic> json) => MarketPlace(json['listingId']);

}