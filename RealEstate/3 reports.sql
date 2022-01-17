--1) I want a report of all the houses sorted by the block and then by the town/city
select *
from Property
order by Street, Town

--2) I want a report of all the houses sorted by realtor
select *
from Property
order by Realtor

--3) a report of how long it took for each house to sell
select AddressNo, Street, Town, DaysToSell = datediff(day, DateOnMarket, DateSold)
from Property
where DateSold is not null
order by Town, Street, AddressNo

--4) the price difference from the asking price to the sold price
select AddressNo, Street, Town, PriceDifference = SoldPrice - AskingPrice
from Property
where SoldPrice is not null
order by Town, Street, AddressNo