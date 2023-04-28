using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace SQL
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string GetTable(string personName, string FatherName, string Gender, string symtoms, string dob, string Native, string ECA, string Phone)
        {
            try
            {
                string connstring = "server=localhost;port=3306;uid=root;pwd=pavithran@123;database=sqldatabase";
                MySqlConnection conn = new MySqlConnection(connstring);
                conn.Open();
                string sql = "INSERT INTO sqltable (personName, FatherName, Gender, symtoms, dob, Native, ECA, Phone)VALUES ('" + personName + "','" + FatherName + "','" + Gender + "','" + symtoms + "','" + dob + "', '" + Native + "', '" + ECA + "', '" + Phone + "')";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                sql = "SELECT * FROM sqltable";
                cmd = new MySqlCommand(sql, conn);
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
                        dob = reader.GetString(4),
                        Native = reader.GetString(5),
                        ECA = reader.GetString(6),
                        Phone = reader.GetString(7)
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

    }
}


