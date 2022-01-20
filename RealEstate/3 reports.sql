--1) I want a report of all the houses sorted by the block and then by the town/city
select [Address], Town, Realtor, [Owner], DateSold, Buyer 
from Property
order by Street, Town

--2) I want a report of all the houses sorted by realtor
select [Address], Town, Realtor, [Owner], DateSold, Buyer
from Property
order by Realtor

--3) a report of how long it took for each house to sell
select [Address], Town, Realtor, [Owner], DateSold, Buyer, DaysToSell = datediff(day, DateOnMarket, DateSold)
from Property
where DateSold is not null
order by Town, Street, AddressNo

--4) the price difference from the asking price to the sold price
select [Address], Town, AskingPrice, SoldPrice, PriceDifference = SoldPrice - AskingPrice
from Property
where SoldPrice is not null
order by Town, Street, AddressNo