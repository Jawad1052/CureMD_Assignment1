CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;
GO


CREATE PROCEDURE AddEmployee
    @Name VARCHAR(50),
    @Age INT,
    @DepartmentID INT
AS
BEGIN
    INSERT INTO Employees (Name, Age, DepartmentID)
    VALUES (@Name, @Age, @DepartmentID);
END;
GO

CREATE PROCEDURE UpdateEmployeeAge
    @ID INT,
    @NewAge INT
AS
BEGIN
    UPDATE Employees
    SET Age = @NewAge
    WHERE ID = @ID;
END;
GO

CREATE PROCEDURE DeleteEmployee
    @ID INT
AS
BEGIN
    DELETE FROM Employees
    WHERE ID = @ID;
END;
GO
