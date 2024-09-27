use car_rental_system;
-- 1. Update the daily rate for a Mercedes car to 68.

-- Update Vehicle
-- set dailyRate = 68.00
-- where make = 'Mercedes' and model = 'C-Class';

-- select * from vehicle;

-- 2. Delete a specific customer and all associated leases and payments.

-- declare @toDel int = 7;

-- Delete related payments

-- Delete from Payment
-- where leaseID in (select leaseID from Lease where customerID = @toDel);

-- -- Delete related leases
-- Delete from Lease
-- where customerID = @toDel;

-- -- Delete the customer
-- delete from Customer
-- where customerID = @toDel;

-- select * from customer;
-- select * from lease;
-- select * from payment;


-- 3. Rename the "paymentDate" column in the Payment table to "transactionDate".

-- EXEC sp_rename 'Payment.paymentDate', 'transactionDate', 'column';
-- select * from payment;

-- 4. Find a specific customer by email.

-- select * from Customer
-- where email = 'johndoe@example.com';

-- 5. Get active leases for a specific customer.

-- select * from Lease
-- where customerID = 6
-- and GETDATE() between startDate and endDate;


-- note: you will see no output as date in 
-- the table is for 2023 but Currentlly we are in 2024.





-- 6. Find all payments made by a customer with a specific phone number.

-- select Payment.* from Payment
-- Join Lease on Payment.leaseID = Lease.leaseID
-- Join Customer ON Lease.customerID = Customer.customerID
-- where Customer.phoneNumber = '555-555-5555';




-- 7. Calculate the average daily rate of all available cars.


-- select AVG(dailyRate) as avgDailyRate
-- from Vehicle
-- where status = 'available';





-- 8. Find the car with the highest daily rate.

-- select top 1 * from Vehicle
-- order by dailyRate DESC;




-- 9. Retrieve all cars leased by a specific customer.



-- select v.* from Vehicle v
-- Join Lease L on v.vehicleID = L.vehicleID
-- where L.customerID = 1;



-- 10. Find the details of the most recent lease.


-- select TOP 1 * from Lease order by endDate desc;


-- 11. List all payments made in the year 2023.



-- select * from Payment where YEAR(transactionDate) = 2023;

-- Note: I am using transactionDate as we earlier change the the column name.

-- 12. Retrieve customers who have not made any payments.

-- select * from Customer
-- where customerID not in (
--     select distinct L.customerID 
--     from Lease L
--     join Payment P on L.leaseID = P.leaseID
-- );

-- 13. Retrieve Car Details and Their Total Payments.

-- select V.make, V.model, SUM(P.amount) as totalPayments
-- from Vehicle V
-- join Lease L on V.vehicleID = L.vehicleID
-- join Payment P on L.leaseID = P.leaseID
-- group by V.make, V.model;



-- 14. Calculate Total Payments for Each Customer.

-- select C.firstName, C.lastName, SUM(P.amount) as totalPayments
-- from Customer C join Lease L on C.customerID = L.customerID
-- join Payment P on L.leaseID = P.leaseID
-- group by C.firstName, C.lastName;



-- 15. List Car Details for Each Lease.

-- select L.leaseID, V.make, V.model, L.startDate, L.endDate
-- from Lease L  join Vehicle V ON L.vehicleID = V.vehicleID;


-- 16. Retrieve Details of Active Leases with Customer and Car Information.

-- select L.leaseID, C.firstName, C.lastName, V.make, V.model, L.startDate, L.endDate
-- from Lease L join Customer C on L.customerID = C.customerID
-- join Vehicle V on L.vehicleID = V.vehicleID
-- where GETDATE() between L.startDate and L.endDate;


-- note: you will see no output as date in the table is for 2023
-- but Currentlly we are in 2024.


-- 17. Find the Customer Who Has Spent the Most on Leases.

-- select TOP 1 C.firstName, C.lastName, SUM(P.amount) as totalPayments from Customer C join Lease L on C.customerID = L.customerID
-- join Payment P on L.leaseID = P.leaseID group by C.firstName, C.lastNamen order by totalPayments DESC;




-- 18. List All Cars with Their Current Lease Information.


-- select V.make, V.model, L.startDate, L.endDate, C.firstName, C.lastName
-- from Vehicle V
-- left join Lease L ON V.vehicleID = L.vehicleID
-- left join customer C ON L.customerID = C.customerID;


SELECT L.leaseID, C.firstName, C.lastName, V.make, V.model, L.startDate, L.endDate
FROM Lease L
JOIN Customer C ON L.customerID = C.customerID
JOIN Vehicle V ON L.vehicleID = V.vehicleID
WHERE EXISTS (
    SELECT L.leaseID
    FROM Lease L
    WHERE GETDATE() BETWEEN L.startDate AND L.endDate
);




-- note: you will see no output as date in 
-- the table is for 2023 but Currentlly we are in 2024.