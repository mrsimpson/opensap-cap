namespace oj.opensapcap.bookshop;

using { cuid, Currency, managed } from '@sap/cds/common';

type Place : String(100);


entity Books : managed {
    key ID: Integer;
    title: localized String(100);
    description: localized String(1000);
    stock: Integer;
    price: Decimal(9,2);
    currency: Currency;
    author: Association to Authors
}

entity Authors : managed {
    key ID: Integer;
    name: String(200);
    dateOfBirth: Date;
    placeOfBirth: Place;
    dateOfDeath: Date;
    placeOfDeath: Place;
    books: Association to many Books on books.author = $self
}

entity Orders : managed, cuid {
    orderNo: String @(
        title: '{i18n>Order number}',
        description: '{i18n>Human readable oder number}'
    );
    items: Composition of many OrderItems on items.parent = $self;
}

entity OrderItems : managed, cuid {
    parent: Association to one Orders;
    book: Association to one Books;
    quantity: Integer;
}