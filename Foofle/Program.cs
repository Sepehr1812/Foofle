﻿using ConsoleTables;
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
                    case "2":
                        Edit();
                        break;
                    case "3":
                        Block();
                        break;
                    case "4":
                        Send();
                        break;
                    case "5":
                        GetEmails(0);
                        break;
                    case "6":
                        GetEmails(1);
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

        static void Edit()
        {
            Console.WriteLine("If you don't want to edit something, just enter '~' and press enter.\n");
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
            using SqlCommand cmd = new SqlCommand("Edit", con) { CommandType = CommandType.StoredProcedure };
            if (Password == "~")
                cmd.Parameters.Add(new SqlParameter("@Password", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@Password", Password));

            if (PrimaryPhone == "~")
                cmd.Parameters.Add(new SqlParameter("@PrimaryPhone", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@PrimaryPhone", PrimaryPhone));

            if (FName == "~")
                cmd.Parameters.Add(new SqlParameter("@FirstName", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@FirstName", FName));

            if (LName == "~")
                cmd.Parameters.Add(new SqlParameter("@LastName", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@LastName", LName));

            if (Phone == "~")
                cmd.Parameters.Add(new SqlParameter("@Phone", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@Phone", Phone));

            if (BirthDate == "~")
                cmd.Parameters.Add(new SqlParameter("@BirthDate", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@BirthDate", BirthDate));

            if (Nickname == "~")
                cmd.Parameters.Add(new SqlParameter("@Nickname", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@Nickname", Nickname));

            if (IDNumber == "~")
                cmd.Parameters.Add(new SqlParameter("@IDNumber", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@IDNumber", IDNumber));

            if (Address == "~")
                cmd.Parameters.Add(new SqlParameter("@Address", DBNull.Value));
            else
                cmd.Parameters.Add(new SqlParameter("@Address", Address));

            cmd.Parameters.Add(new SqlParameter("@DoNotShare", DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();
            cmd.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        static void Block()
        {
            Console.WriteLine("Type IDs you want to block. Seperate by ','." +
                "If you don't want to block anyone, just type '~' and press enter:\n\n");

            // displaying users
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("GetUsers", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            dataTable.Clear();
            da.Fill(dataTable);

            // displaying table
            var table = new ConsoleTable("ID", "Username");
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
            // END of displaying

            Console.WriteLine("\n\nIDs:");
            String IDs = Console.ReadLine();

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd2 = new SqlCommand("Edit", con) { CommandType = CommandType.StoredProcedure };
            cmd2.Parameters.Add(new SqlParameter("@Password", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@PrimaryPhone", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@FirstName", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@LastName", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@Phone", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@BirthDate", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@Nickname", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@IDNumber", DBNull.Value));
            cmd2.Parameters.Add(new SqlParameter("@Address", DBNull.Value));
            if (IDs == "~")
                cmd2.Parameters.Add(new SqlParameter("@DoNotShare", DBNull.Value));
            else
                cmd2.Parameters.Add(new SqlParameter("@DoNotShare", IDs));
            cmd2.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();
            cmd2.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd2.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        static void Send()
        {
            Console.WriteLine("Enter Recivers (seperate by ','):");
            String Receivers = Console.ReadLine();
            Console.WriteLine("Enter CC Recivers (seperate by ','):");
            String CCReceivers = Console.ReadLine();
            Console.WriteLine("Subject:");
            String Subject = Console.ReadLine();
            Console.WriteLine("Text:");
            String Text = Console.ReadLine();

            // Set connection to the database
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("Send", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@Receivers", Receivers));
            cmd.Parameters.Add(new SqlParameter("@CCReceivers", CCReceivers));
            cmd.Parameters.Add(new SqlParameter("@Subject", Subject));
            cmd.Parameters.Add(new SqlParameter("@Text", Text));
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();
            cmd.ExecuteNonQuery();

            // read output value from @MSG
            MSG = cmd.Parameters["@MSG"].Value.ToString();
            Console.WriteLine(MSG);

            con.Close();
        }

        static void GetEmails(int isSent)
        {
            Console.WriteLine("Enter Page Number:");
            String PageNo = Console.ReadLine();

            // Set connection to the database
            string conString = "Server=(LocalDb)\\MSSQLLocalDB;Database=Foofle;Trusted_Connection=true";
            using SqlConnection con = new SqlConnection(conString);

            // Set up a command with the given query and associate this with the current connection.
            using SqlCommand cmd = new SqlCommand("GetEmails", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.Add(new SqlParameter("@IsSent", isSent));
            cmd.Parameters.Add(new SqlParameter("@PageNumber", PageNo));
            cmd.Parameters.Add(new SqlParameter("@MSG", SqlDbType.NVarChar, 512)).Direction = ParameterDirection.Output;

            // Open connection to the database
            con.Open();
            cmd.ExecuteNonQuery();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            dataTable.Clear();
            da.Fill(dataTable);

            // displaying table
            ConsoleTable table;
            if (isSent == 0)
                table = new ConsoleTable("Id", "Subject", "Time", "Is Read");
            else
                table = new ConsoleTable("Id", "Subject", "Time");

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
