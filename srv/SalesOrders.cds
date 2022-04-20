using {com.dhl as dhl} from '../db/schema';

define service SalesOrders{

 entity Header as select from dhl.HeaderSales {
        email @mandatory,
        firstname,
        lastname,
        country,
        createon,
        deliverydate,
        orderstatus,
        imagenurl,
        items,

    };

    entity Items as select from dhl.SalesItems {
        ID,
        name,
        description,
        releasedate,
        discontinuedate,
        price,
        height,
        weidth,
        depth,
        quantity,
        unitofmesure  @mandatory,
        Header,
        
    };

    @readonly
    entity unitofmesure as select from dhl.UnitOfMesure{
        Id,
        name, 
    };
      @readonly
      entity orderstatus as select from dhl.orderstatus{
          id,
          status,
      };

      @readonly
      entity Countries_d as select from dhl.V_Country{
          code,
          name,
       };
   //entity customer as select from dhl.Customer{
  //   name,
  //   Adress,
   //  Phone,
 //    email
   //}
};