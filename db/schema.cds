namespace sap.capire.sales;

entity Product {
  name : String;
  key code  : String;
  price  : Integer;
  manufacturer : String;
}

entity Order {
  ordernumber : Integer;
  serialnumber_code : Association to Product on serialnumber_code.code = serialnumber;
  key serialnumber : String; // FK
  rating  : Decimal(10,1);
  deliverytime : Integer;
  quantity : Integer;
  orderdate : Timestamp;
}

entity Manufacturer {
  manufacturer_code : Association to Product on manufacturer_code.manufacturer = manufacturer;
  key manufacturer : String; // FK
  countrycode : String;
  foundingyear : Integer;
}

entity OrderedProduct as SELECT from Product LEFT JOIN Order on serialnumber = code {
  name, serialnumber, price, rating, deliverytime, quantity, orderdate
};