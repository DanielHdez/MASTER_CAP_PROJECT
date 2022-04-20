using SalesOrders as service from '../../srv/SalesOrders';

annotate service.Header with @(
    UI.LineItem : [
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
            $Type : 'UI.DataField',
            Label : 'country_code',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createon',
            Value : createon,
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
                $Type : 'UI.DataField',
                Label : 'country_code',
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
            {
                $Type : 'UI.DataField',
                Label : 'orderstatus_id',
                Value : orderstatus_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'imagenurl',
                Value : imagenurl,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
