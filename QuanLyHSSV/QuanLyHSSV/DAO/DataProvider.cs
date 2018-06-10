using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHSSV
{
    public class DataProvider
    {
        private static DataProvider instance;

        public static DataProvider Instance
        {
            get
            {
                if (instance == null) instance = new DataProvider(); return instance;
            }

            private set
            {
                instance = value;
            }
        }

        private DataProvider() { }

        public DataTable ExcuteQuery(string query, object[] paramater = null)
        {
            DataTable data = new DataTable();

            string connectionStr = @"Data Source=ADMIN\TC;Initial Catalog='Quan ly Hs Gv';Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionStr);

            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                if (paramater != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, paramater[i]);
                            i++;
                        }
                    }
                }
                adapter.Fill(data);
                connection.Close();
            }

            return data;
        }

        public int ExcuteNonQuery(string query, object[] paramater = null)
        {
            int data = 0;

            string connectionStr = @"Data Source=ADMIN\TC;Initial Catalog='Quan ly Hs Gv';Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionStr);

            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                if (paramater != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, paramater[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        public object ExcuteScala(string query, object[] paramater = null)
        {
            object data = 0;
            string connectionStr = @"Data Source=ADMIN\TC;Initial Catalog='Quan ly Hs Gv';Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);

                //command.Parameters.AddWithValue("@username",id);
                if (paramater != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, paramater[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }


            return data;
        }
    }
}
