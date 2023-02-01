using { sap.capire.sales as db } from '../db/schema';

service SalesService @(requires : 'any') {
    entity OrderedProduct as projection on db.OrderedProduct;
    entity Product   as projection on db.Product;
    entity Order as projection on db.Order;
    entity Manufacturer as projection on db.Manufacturer;
}