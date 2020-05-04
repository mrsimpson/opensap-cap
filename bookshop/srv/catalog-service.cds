using { oj.opensapcap.bookshop as my } from '../db/schema';

service CatalogService @(path: '/browse') {

    @readonly
    entity Books as SELECT from my.Books {
        *,
        author.name as author,
    } excluding {
        createdBy,
        modifiedBy
    };

    @_requires: 'authenticated-user'
    @insertonly
    entity Orders as projection on my.Orders;

}