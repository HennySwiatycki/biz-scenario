use RealEstate
GO
drop table if exists Property
go
create table Property( --Not all houses, some are empty lots
    PropertyId int not null identity primary key,
    AddressNo varchar(255) not null constraint c_property_addressno_not_blank check(AddressNo > ''),
    Street varchar(255) not null constraint c_property_street_not_blank check(Street > ''),
    Town varchar(255) not null constraint c_property_town_not_blank check(Town > ''),
    PropertyType varchar(255) not null constraint c_property_property_type_not_blank check(PropertyType > ''),
    Bedrooms int not null constraint c_property_bedrooms_at_least_zero check(Bedrooms >= 0),
    Bathrooms decimal(3,1) not null constraint c_property_bathrooms_at_least_zero check(Bathrooms >= 0),
    HouseSqFt int not null constraint c_property_housesqft_at_least_zero check(HouseSqFt >= 0), 
    LotSqFt int not null constraint c_property_lotsqft_greater_than_zero check(LotSqFt > 0), 
    [Owner] varchar(255) not null constraint c_property_owner_not_blank check([Owner] > ''),
    Contact varchar(255) not null constraint c_property_contact_not_blank check(Contact > ''),
    Realtor varchar(255) not null constraint c_property_realtor_not_blank check(Realtor > ''),
    DateOnMarket date not null constraint c_property_date_on_market_has_passed check(DateOnMarket <= getdate()),
    DateSold date,
    AskingPrice int not null constraint c_property_asking_price_between_100K_and_9M900K check(AskingPrice between 100000 and 9900000),
    SoldPrice int constraint c_property_sold_price_no_greater_than_9M900K check(SoldPrice <= 9900000),
    Buyer varchar(255) not null,
    DateInserted datetime not null constraint d_property_date_inserted_default default(getdate()),
    [Address] as concat(AddressNo, ' ', Street),
    constraint c_property_lotsqft_at_least_housesqft check(LotSqFt >= HouseSqFt),
    constraint c_property_date_sold_at_least_date_on_market check(DateSold >= DateOnMarket)
    --omitting constraint SoldPrice >= AskingPrice as it seems not realistic! Need to have a conversation with the client ;)
)
