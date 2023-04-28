using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SQL
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string GetTable(string personName, string FatherName, string Gender, string symtoms, string dob, string country, string ECA, string Phone)
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "INSERT INTO dropdowntable (personName, FatherName, Gender, symtoms, dob, country, ECA, Phone)VALUES ('" + personName + "','" + FatherName + "','" + Gender + "','" + symtoms + "','" + dob + "', '" + country + "', '" + ECA + "', '" + Phone + "')";
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
        public static string GetTable2()
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "SELECT * FROM dropdowntable where isdelete=0";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                List<object> results = new List<object>();
                while (reader.Read())
                {
                    var row = new
                    {
                        personName = reader.GetString(0),
                        FatherName = reader.GetString(1),
                        Gender = reader.GetString(2),
                        symtoms = reader.GetString(3),
                        dob = reader.GetDateTime(4),/*.ToString("yyyy-MM-dd"),*/
                        country = reader.GetString(5),
                        ECA = reader.GetString(6),
                        Phone = reader.GetString(7),
                        id = reader.GetString(8)
                    };
                    results.Add(row);
                }
                conn.Close();
                return JsonConvert.SerializeObject(results);
            }
            catch (MySqlException ex)
            {
                return ex.ToString();
            }
        }

        //[System.Web.Services.WebMethod]
        //public static string GetTable3()
        //{
        //    try
        //    {
        //        string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
        //        MySqlConnection conn = new MySqlConnection(connstring);
        //        conn.Open();
        //        string sql = "SELECT * FROM countrydropdown";
        //        MySqlCommand cmd = new MySqlCommand(sql, conn);
        //        MySqlDataReader reader = cmd.ExecuteReader();

        //        DataTable results = new DataTable();
        //        results.Load(reader);

        //        conn.Close();
        //        return JsonConvert.SerializeObject(results); // return JSON-formatted data
        //    }
        //    catch (MySqlException ex)
        //    {
        //        return ex.ToString();
        //    }
        //}
        public class Person
        {
            public int Id { get; set; }
            public string DisplayText { get; set; }
        }
        //[System.Web.Services.WebMethod]
        //public static List<Person> GetTable3()
        //{
        //    List<Person> dropdownList = new List<Person>();

        //    string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
        //    MySqlConnection connection = new MySqlConnection(connstring);

        //    connection.Open();
        //    MySqlCommand command = new MySqlCommand("SELECT * FROM countrydropdown", connection);
        //    MySqlDataReader reader = command.ExecuteReader();

        //    while (reader.Read())
        //    {
        //        Person dropdown = new Person
        //        {
        //            Id = Convert.ToInt32(reader["id"]),
        //            DisplayText = reader["country"].ToString()
        //        };
        //        dropdownList.Add(dropdown);
        //    }

        //    reader.Close();
        //    connection.Close();


        //    return dropdownList;
        //}
        [System.Web.Services.WebMethod]
        public static List<Person> GetTable3()
        {
            List<Person> dropdownList = new List<Person>();

            string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
            MySqlConnection connection = new MySqlConnection(connstring);

            connection.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM countrydropdown", connection);
            MySqlDataReader reader = command.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(reader);

            connection.Close();

            foreach (DataRow row in dataTable.Rows)
            {
                Person dropdown = new Person
                {
                    Id = Convert.ToInt32(row["id"]),
                    DisplayText = row["country"].ToString()
                };
                dropdownList.Add(dropdown);
            }

            return dropdownList;
        } 
        //[System.Web.Services.WebMethod]
        //public static string GetTable4(string personName, string FatherName, string Gender, string symtoms, string dob, string country, string ECA, string Phone)
        //{
        //    try
        //    {
        //        string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
        //        MySqlConnection conn = new MySqlConnection(connstring);
        //        conn.Open();
        //        string sql = "update dropdowntable set personName=personName_value,FatherName=FatherName_value,Gender=Gender_value,symtoms=symtoms_value,dob=dob_value,country=country_value,ECA=ECA_value,Phone=Phone_value where id= id_value;";
        //        MySqlCommand cmd = new MySqlCommand(sql, conn);
        //        MySqlDataReader reader = cmd.ExecuteReader();
        //        string result = "reader";
        //        conn.Close();
        //        return result;
        //    }
        //    catch (MySqlException ex)
        //    {
        //        return ex.ToString();
        //    }
        //}
        [System.Web.Services.WebMethod]
        public static string GetTable4(int id, string personName, string FatherName, string Gender, string symtoms, string dob, string country, string ECA, string Phone)
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "update dropdowntable set personName=@personName, FatherName=@FatherName, Gender=@Gender, symtoms=@symtoms, dob=@dob, country=@country, ECA=@ECA, Phone=@Phone where id=@id;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@personName", personName);
                cmd.Parameters.AddWithValue("@FatherName", FatherName);
                cmd.Parameters.AddWithValue("@Gender", Gender);
                cmd.Parameters.AddWithValue("@symtoms", symtoms);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@country", country);
                cmd.Parameters.AddWithValue("@ECA", ECA);
                cmd.Parameters.AddWithValue("@Phone", Phone);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                return "Success";
            } 
            catch (MySqlException ex)
            {
                return ex.ToString();
            }
        }
        [System.Web.Services.WebMethod]
        public static string GetTable5(int id)
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "update dropdowntable set isdelete='1' where id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", id);
                int rowsAffected = cmd.ExecuteNonQuery();
                string result = "success";
                conn.Close();
                return result;
            }
            catch (MySqlException ex)
            {
                return ex.ToString();
            }
        }
    }
}
//  string connstring = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
/*    < connectionStrings >

        < add name = "ApplicationServices" connectionString = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=webform" />

    </ connectionStrings >*/