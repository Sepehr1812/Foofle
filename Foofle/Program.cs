using System;
using System.Data;
using System.Data.SqlClient;

namespace Foofle
{
    class Program
    {
        static String MSG = "";
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome!");
            String n = Console.ReadLine();

            while (true)
            {
                Console.WriteLine("\nEnter 1 for Register or 2 for Login:");
                if (n == "1")
                    Register();
                else if (n == "2")
                {

                }
            }
        }

        static void Register()
        {
            Console.WriteLine("Enter Username:");
            String Username = Console.ReadLine();
            Console.WriteLine("Password:");
            String Password = Console.ReadLine();
            Console.WriteLine("Primary Phone");
            String PrimaryPhone = Console.ReadLine();
            Console.WriteLine("First Name");
            String FName = Console.ReadLine();
            Console.WriteLine("Last Name");
            String LName = Console.ReadLine();
            Console.WriteLine("Phone");
            String Phone = Console.ReadLine();
            Console.WriteLine("Birth Date in format \"YYYY-MM-DD\"");
            String BirthDate = Console.ReadLine();
            Console.WriteLine("Nickname");
            String Nickname = Console.ReadLine();
            Console.WriteLine("ID Number");
            String IDNumber = Console.ReadLine();
            Console.WriteLine("Address");
            String Address = Console.ReadLine();

            // Open connection to the database
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";

            using SqlConnection con = new SqlConnection(conString);
            con.Open();

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("Register", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@Username", Username));
            cmd.Parameters.Add(new SqlParameter("@Password", Password));
            cmd.Parameters.Add(new SqlParameter("@PrimaryPhone", PrimaryPhone));
            cmd.Parameters.Add(new SqlParameter("@FirstName", FName));
            cmd.Parameters.Add(new SqlParameter("@LastName", LName));
            cmd.Parameters.Add(new SqlParameter("@Phone", Phone));
            cmd.Parameters.Add(new SqlParameter("@BirthDate", BirthDate));
            cmd.Parameters.Add(new SqlParameter("@Nickname", Nickname));
            cmd.Parameters.Add(new SqlParameter("@IDNumber", IDNumber));
            cmd.Parameters.Add(new SqlParameter("@Address", Address));
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        
    }
}
