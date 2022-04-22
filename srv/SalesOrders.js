cds = require("@sap/cds");
const { HeaderSales } = cds.entities("com.dhl");
const { SalesItems } = cds.entities("com.dhl");
module.exports = (srv) => {

//*******************READ HEADER****************************/

srv.on("READ", "Headers", async (req) => {
    if (req.data.email !== undefined) {
        return await SELECT.from`com.dhl.HeaderSales`
            .where`email = ${req.data.email}`;
    }
    return await SELECT.from(HeaderSales);
});

//*******************READ ITEMS****************************/

srv.on("READ", "Item", async (req) => {
    if (req.data.email !== undefined) {
        return await SELECT.from(SalesItems)
        .where`Header_email = ${req.data.Header_email}`;
    }
    return await SELECT.from(SalesItems);
});

//*******************AFTER****************************/

srv.after("READ", "Headers", (data) => {

    let cont = 0;
    for (let value of data) {

        if (data[cont].createon == '') {

            data[cont].createon = new Date();

            data[cont].orderstatus_id = '0';



        } else if (Date.now() < data[cont].createon) {
            data[cont].orderstatus_id = '1';

        } else {

            data[cont].orderstatus_id = '2';
        }

        console.log(data[0].email);
        cont = cont + 1;
    }
    console.log(data);
    return data;
});



//*******************CREATE****************************/
/* #######Create Header##################*/
srv.on("CREATE", "Headers", async (req) => {
    let Data = await cds
        .transaction(req)   // Generamos una nueva funcion y con el run la llamamos 
        .run(
            INSERT.into(HeaderSales).entries({
                email: req.data.email,
                firstName: req.data.firstName,
                lastname: req.data.lastname,
                country_code: req.data.country_code,
                createon: req.data.createon,
                deliverydate: req.data.deliverydate,
                orderstatus_id: req.data.orderstatus_id,
                imagenurl: req.data.imagenurl,
            })
        )
        .then((resolve, reject) => {       //Aqui se recibe la informacion https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
            console.log("Resolve", resolve);
            console.log("Reject", reject);

            if (typeof resolve !== "undefined") {
                return req.data;
            } else {
                req.error(409, "Record Not Inserted");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Vemos si de graba ", Data);
    return Data;
});

/* #######Create Item##################*/
srv.on("CREATE", "Item", async (req) => {
    let item = await cds
        .transaction(req)   // Generamos una nueva funcion y con el run la llamamos 
        .run(
            INSERT.into`com.dhl.SalesItems`.entries({
                name: req.data.name,
                description: req.data.description,
                releasedate: req.data.releasedate,
                discontinuedate: req.data.discontinuedate,
                price: req.data.price,
                height: req.data.height,
                weidth: req.data.weidth,
                depth: req.data.depth,
                quantity: req.data.quantity,
                unitofmesure_Id: req.data.unitofmesure_Id,
                Header_email: req.data.Header_email,
            })
        )
        .then((resolve, reject) => {       //Aqui se recibe la informacion https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
            console.log("Resolve", resolve);
            console.log("Reject", reject);

            if (typeof resolve !== "undefined") {
                return req.item;
            } else {
                req.error(409, "Record Not Inserted");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Vemos si de graba ", item);
    return item;
});

/*********************  UPDATE **********************/
/* #######Update Header##################*/
srv.on("UPDATE", "Headers", async (req) => {
    let DataUpda = await cds
        .transaction(req)
        .run([
            UPDATE(HeaderSales, req.data.email).set({
                firstname: req.data.firstname
                /*lastname: req.data.lastname,
                country_code: req.data.country_code,
                createon: req.data.createon,
                deliverydate: req.data.deliverydate,
                orderstatus_id: req.data.orderstatus_id,
                imagenurl: req.data.imagenurl,*/
            }),
        ])
        .then((resolve, reject) => {
            console.log("Resolve: ", resolve);
            console.log("Reject: ", reject);

            if (resolve[0] == 0) {
                req.error(409, "Record Not Found");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Before End", DataUpda );
    return DataUpda ;
});

/* #######Update Item##################*/

srv.on("UPDATE", "Item", async (req) => {
    let DataUpda = await cds
        .transaction(req)
        .run([
            UPDATE(SalesItems, req.data.id).set({
                name: req.data.name,
                description: req.data.description,
                releasedate: req.data.releasedate,
                discontinuedate: req.data.discontinuedate,
                price: req.data.price,
                height: req.data.height,
                weidth: req.data.weidth,
                depth: req.data.depth,
                quantity: req.data.quantity,
                unitofmesure_Id: req.data.unitofmesure_Id,
                Header_email: req.data.Header_email,
            }),
        ])
        .then((resolve, reject) => {
            console.log("Resolve: ", resolve);
            console.log("Reject: ", reject);

            if (resolve[0] == 0) {
                req.error(409, "Record Not Found");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Before End", DataUpda );
    return DataUpda ;
});

/****************************Delete ***************** */

srv.on("DELETE", "Headers", async (req) => {
    let returnData = await cds
        .transaction(req)
        .run(
            DELETE.from(HeaderSales).where({
                email: req.data.email,
            })
        )
        .then((resolve, reject) => {
            console.log("Resolve", resolve);
            console.log("Reject", reject);

            if (resolve !== 1) {
                req.error(409, "Record Not Found");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Before End", returnData);
    return await returnData;
});
/****************************************************************** */
};