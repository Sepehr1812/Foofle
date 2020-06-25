using ConsoleTables;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http.Headers;

namespace Foofle
{
    class Program
    {
        static String MSG = "";
        
        // data table
        static readonly DataTable dataTable = new DataTable();

        static void Main(string[] args)
        {
            Console.WriteLine("Welcome!");
            String n;
            
            //while (true)
            //{
            //    Console.WriteLine("\nEnter 1 for Register or 2 for Login:");
            //    n = Console.ReadLine();

            //    if (n == "1")
            //        Register();
            //    else if (n == "2")
            //    {
            //        Login();

            //        if (MSG == "User logged in successfully")
            //            break;
            //    }
            //}

            while (true)
            {
                Console.WriteLine("\nEnter 1 for see notifications," +
                " 2 for edit, 3 for block someone, 4 for send an email," +
                " 5 for see your inbox, 6 for your outbox, 7 for see your info," +
                " 8 for see someone's info, 9 for delete yourself.");
                n = Console.ReadLine();

                switch (n)
                {
                    case "1":
                        GetNotifications();
                        break;
                    default:
                        break;
                }

            }
        }

        static void Register()
        {
            Console.WriteLine("Enter Username:");
            String Username = Console.ReadLine();
            Console.WriteLine("Password:");
            String Password = Console.ReadLine();
            Console.WriteLine("Primary Phone:");
            String PrimaryPhone = Console.ReadLine();
            Console.WriteLine("First Name:");
            String FName = Console.ReadLine();
            Console.WriteLine("Last Name:");
            String LName = Console.ReadLine();
            Console.WriteLine("Phone:");
            String Phone = Console.ReadLine();
            Console.WriteLine("Birth Date in format \"YYYY-MM-DD\":");
            String BirthDate = Console.ReadLine();
            Console.WriteLine("Nickname:");
            String Nickname = Console.ReadLine();
            Console.WriteLine("ID Number:");
            String IDNumber = Console.ReadLine();
            Console.WriteLine("Address:");
            String Address = Console.ReadLine();

            // Set connection to the database
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

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

            // Open connection to the database
            con.Open();
            cmd.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        static void Login()
        {
            Console.WriteLine("Enter Username:");
            String Username = Console.ReadLine();
            Console.WriteLine("Password:");
            String Password = Console.ReadLine();

            // Set connection to the database
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("Login", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@Username", Username));
            cmd.Parameters.Add(new SqlParameter("@Password", Password));
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();
            cmd.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        static void GetNotifications()
        {
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("GetNotifcations", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            dataTable.Clear();
            da.Fill(dataTable);

            // displaying table
            var table = new ConsoleTable("Text", "Time");
            var RowArray = new ArrayList();
            foreach (DataRow row in dataTable.Rows)
            {
                RowArray.Clear();
                foreach (var item in row.ItemArray)
                    RowArray.Add(item);

                table.AddRow(RowArray.ToArray());
            }

            table.Write();


            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
            da.Dispose();
        }
    }
}
