using { oj.opensapcap.bookshop as my } from '../db/schema';

service AdminService @(_requires: 'admin') {
    entity Books as projection on my.Books;
    entity Authors as projection on my.Authors;
    entity Orders as projection on my.Orders;
}
