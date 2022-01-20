use master 
go
if not exists(select * from sys.databases where [name] = 'RealEstate')
    create database RealEstate
go
use RealEstate