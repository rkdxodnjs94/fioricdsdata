namespace sap.capire.sales;

entity Product {
  name : String;
  key code  : String;
  price  : Integer;
  manufacturer : String;
}

entity Order {
  orderNumber : Integer;
  serialNumber_code : Association to Product on serialNumber_code.code = serialNumber;
  key serialNumber : String; // FK
  rating  : Decimal(10,1);
  deliveryTime : Integer;
  quantity : Integer;
  orderDate : Timestamp;
}

entity Manufacturer {
  manufacturer_code : Association to Product on manufacturer_code.manufacturer = manufacturer;
  key manufacturer : String; // FK
  countryCode : String;
  foundingYear : Integer;
}

entity OrderedProduct as SELECT from Product LEFT JOIN Order on serialNumber = code {
  name, serialNumber, price, rating, deliveryTime, quantity, orderDate, manufacturer
};