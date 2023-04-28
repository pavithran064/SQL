using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQL
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static bool Getblood(string Blood_Bank_Name, string Blood_Group)
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=blood";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "SELECT Quantity FROM blooddetails WHERE id = '" + Blood_Bank_Name + "' and bloodid = '" + Blood_Group + "' and Quantity>=3";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                /* var dt = new DataTable();
                dt.Load(reader);
                if (dt.Rows.Count > 0) { return true; }
                else { return false; }*/
                DataTable results = new DataTable();
                results.Load(reader);
                if (results.Rows.Count > 0) { return true; }
                else { return false; }

            }

            catch (Exception)
            {
                return false;
            }



        }
        public class Person
        {
            public int BankId { get; set; }
            public string DisplayText { get; set; }
        }
        [System.Web.Services.WebMethod]
        public static List<Person> Getbank()
        {
            List<Person> dropdownList = new List<Person>();

            string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=blood";
            MySqlConnection connection = new MySqlConnection(connstring);

            connection.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM bloodbank", connection);
            MySqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Person dropdown = new Person
                {
                    BankId = Convert.ToInt32(reader["id"]),
                    DisplayText = reader["Blood_Bank_Name"].ToString()
                };
                dropdownList.Add(dropdown);
            }

            reader.Close();
            connection.Close();


            return dropdownList;
        }
        public class Personblood
        {
            public int BloodId { get; set; }
            public string DisplayText { get; set; }
        }
        [System.Web.Services.WebMethod]
        public static List<Personblood> Getblooodgroup()
        {
            List<Personblood> dropdownList = new List<Personblood>();

            string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=blood";
            MySqlConnection connection = new MySqlConnection(connstring);

            connection.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM bloodgroup", connection);
            MySqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Personblood dropdown = new Personblood
                {
                    BloodId = Convert.ToInt32(reader["bloodid"]),
                    DisplayText = reader["bloodgroup"].ToString()
                };
                dropdownList.Add(dropdown);
            }

            reader.Close();
            connection.Close();


            return dropdownList;
        }
        [System.Web.Services.WebMethod]
        public static string Insertdetails(string personName, string FatherName, string Gender, string dob, string Hospital, string symtoms, string disease, string Phone, string id, string bloodid)
        {
            try 
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=blood";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "INSERT INTO registredlist(personName, FatherName, Gender, dob, Hospital, symtoms, disease, Phone, id, bloodid)VALUES ('" + personName + "','" + FatherName + "','" + Gender + "','" + dob + "','" + Hospital + "','" + symtoms + "', '" + disease + "', '" + Phone + "', '"+ id + "', '"+ bloodid + "')";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                string result = "reader";
                conn.Close();
                return result;
            }
            catch (MySqlException ex)
            {
                return ex.ToString();
            }
        }
        [System.Web.Services.WebMethod]
        public static string Getdetails()
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=blood";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "SELECT registredlist.personName, registredlist.FatherName, registredlist.Gender, registredlist.dob, registredlist.Hospital, registredlist.symtoms, registredlist.disease, registredlist.Phone,bloodbank.Blood_Bank_Name,bloodgroup.bloodgroup FROM registredlist JOIN bloodbank ON registredlist.id=bloodbank.id  JOIN bloodgroup ON registredlist.bloodid=bloodgroup.bloodid";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();

                DataTable results = new DataTable();
                results.Load(reader);

                conn.Close();
                return JsonConvert.SerializeObject(results); // return JSON-formatted data
            }
            catch (MySqlException ex)
            {
                return ex.ToString();
            }
        }

    }
}