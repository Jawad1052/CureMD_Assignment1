using System.Data;
using System.Data.SqlClient;

string connectionString = "Server=cmdlhrdb01;Database=DemoDB;Trusted_Connection=True;";
using (SqlConnection connection = new SqlConnection(connectionString))
{
    // 1. Execute Stored Procedure to Get All Employees
    using (SqlCommand command = new SqlCommand("GetAllEmployees", connection))
    {
        command.CommandType = CommandType.StoredProcedure;
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Console.WriteLine($"ID: {reader["ID"]}, Name: {reader["Name"]}, Age: {reader["Age"]}, DepartmentID: {reader["DepartmentID"]}");
        }
        connection.Close();
    }

    // 2. Execute Stored Procedure to Add an Employee
    using (SqlCommand command = new SqlCommand("AddEmployee", connection))
    {
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@Name", "Hamza");
        command.Parameters.AddWithValue("@Age", 30);
        command.Parameters.AddWithValue("@DepartmentID", 1);
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
    }

    // 3. Execute Stored Procedure to Update an Employee's Age
    using (SqlCommand command = new SqlCommand("UpdateEmployeeAge", connection))
    {
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@ID", 1);
        command.Parameters.AddWithValue("@NewAge", 41);
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
    }

    // 4. Execute Stored Procedure to Delete an Employee
    using (SqlCommand command = new SqlCommand("DeleteEmployee", connection))
    {
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@ID", 1);
        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();
    }
}