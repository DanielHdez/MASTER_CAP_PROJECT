namespace com.dhl;

using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';

type status : Integer enum {
    Submitted  = 1;
    Fullfiller = 2;
    Shipped    = 3;
    Cancel     = -1;
}


entity HeaderSales {
    key email        : String(40) not null;
        firstname    : String(40);
        lastname     : String(40);
        country      : Association to V_Country;
        createon     : Date default $now;
        deliverydate : Date;
        orderstatus  : Association to orderstatus;
        imagenurl    : String(100);
        items        : Composition of many SalesItems
                           on items.Header = $self;

}

entity SalesItems : cuid {
    name            : String(40);
    description     : String(40);
    releasedate     : DateTime default $now;
    discontinuedate : DateTime;
    price           : Decimal(12, 2);
    height          : Decimal(12, 2);
    weidth          : Decimal(15, 3);
    depth           : Decimal(12, 2);
    quantity        : Decimal(16, 2);
    unitofmesure    : Association to UnitOfMesure;
    Header          : Association to HeaderSales;
}

entity UnitOfMesure {
    key Id : String(2);
        name      : String;

}

entity orderstatus {
  key  id     : Integer;
       status : String(15);

}

entity V_Country {
 key code        : String(3);
    name        : String(15);
}

define entity Customer {
    key name   : String(40);
        Adress : String(25);
        Phone  : String(25);
        email  : String(25)

}
