using SalesOrders as service from '../../srv/SalesOrders';

annotate service.Header with @(
    UI.HeaderInfo      : {
        TypeName       : 'Order',
        TypeNamePlural : 'Orders',
        ImageUrl       : imagenurl,
        Title          : {Value : email},
        Description    : {Value : firstname}
    },
    UI.LineItem        : [
        {
            $Type : 'UI.DataField',
            Label : 'Imagen',
            Value : imagenurl,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstname',
            Value : firstname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastname',
            Value : lastname,
        },
        {
            $Type       : 'UI.DataField',
            Label       : 'orderstatus',
            Value       : orderstatus_id,
            Criticality : orderstatus_id,
        },

        {
            $Type : 'UI.DataField',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createon',
            Value : createon,
        },
    ],
    UI.SelectionFields : [
        country_code,
        createon,
        deliverydate,
        orderstatus_id

    ]
);

annotate service.Header with @(UI.FieldGroup #GeneratedGroup1 : {
    $Type : 'UI.FieldGroupType',
    Data  : [
        /* {
           $Type : 'UI.DataField',
           Label : 'imagenurl',
           Value : Imagen,
       },
       {
           $Type : 'UI.DataField',
           Label : 'email',
           Value : email,
       },
       {
           $Type : 'UI.DataField',
           Label : 'firstname',
           Value : firstname,
       },*/
        {
            $Type : 'UI.DataField',
            Label : 'lastname',
            Value : lastname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'orderstatus',
            Value : orderstatus_id,
        },

        {
            $Type : 'UI.DataField',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createon',
            Value : createon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'deliverydate',
            Value : deliverydate,
        },

    ],
}, );


//Anotacion para la imagen

annotate service.Header with {
    imagenurl @(UI.IsImageURL : true)
};


//Ayudas de Búsqueda
annotate service.Header with {

    orderstatus @(Common : {
        Text                     : {
            $value                 : orderstatus_id,
            ![@UI.TextArrangement] : #TextOnly,
        },
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'orderstatus',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : orderstatus_id,
                    ValueListProperty : 'id'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    //LocalDataProperty : orderstatus,
                    ValueListProperty : 'status'
                }
            ]
        }
    });

    country    @(Common : {
        Text                     : {
            $value                 : country_code,
            ![@UI.TextArrangement] : #TextOnly,
        },
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'Countries_d',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : country_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    //LocalDataProperty : Country_code,
                    ValueListProperty : 'name'
                }
            ]
        }
    });
};


//Anotamos las listas

annotate service.orderstatus with {
    id     @(
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : status,
            ![@UI.TextArrangement] : #TextOnly,
        }}
    );
    status @(UI : {HiddenFilter : true});

}

annotate service.Countries_d with {
    code @(
        UI     : {Hidden : true},
        Common : {Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly,
        }}
    );
    name @(UI : {HiddenFilter : true});

};

// Anotacion para contacto

annotate service.customer with @(Communication : {Contact : {
    $Type : 'Communication.ContactType',
    fn    : name,
    role  : 'Customer',
    photo : 'sap-icon://Customer',
    email : [{
        type    : #work,
        address : email
    }],
    tel   : [{
        type : #work,
        uri  : Phone

    }]
}});


annotate service.Items with @(
    UI.HeaderInfo : {
        TypeName       : 'Item',
        TypeNamePlural : 'Items',
        Title          : {Value : name},
        Description    : {Value : description}
    },
    UI.LineItem   : [
        {
            $Type : 'UI.DataField',
            Label : 'Nombre',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Release Date',
            Value : releasedate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Discontinue Date',
            Value : discontinuedate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },

        {
            $Type : 'UI.DataField',
            Label : 'Height',
            Value : height,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Width',
            Value : weidth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Depth',
            Value : depth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Quantity',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Units',
            Value : unitofmesure_Id,
        },

    ]
);

annotate service.Items with @(
    UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
          /*  {
                $Type : 'UI.DataField',
                Label : 'Nombre',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },*/
            {
                $Type : 'UI.DataField',
                Label : 'Release Date',
                Value : releasedate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Discontinue Date',
                Value : discontinuedate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },

            {
                $Type : 'UI.DataField',
                Label : 'Height',
                Value : height,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Width',
                Value : weidth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Depth',
                Value : depth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Quantity',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Units',
                Value : unitofmesure_Id,
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet2',
        Label  : 'General Information Items',
        Target : '@UI.FieldGroup#GeneratedGroup2',
    }, ]
);


annotate service.Header with @(UI.Facets : [
    {
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'General Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',


    },
    {
        $Type  : 'UI.ReferenceFacet',
        ID     : 'SalesItems',
        Label  : 'General Information Items',
        Target : 'items/@UI.LineItem',
    },
]);
