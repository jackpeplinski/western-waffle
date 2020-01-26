class Transaction {
  String type; 
  /*type is usually not included in the transaction 
  bcs buys are so common... wb charge deactivation?*/
  String location;
  String charge;
  String date;

  Transaction({this.type, this.location, this.charge, this.date});

}