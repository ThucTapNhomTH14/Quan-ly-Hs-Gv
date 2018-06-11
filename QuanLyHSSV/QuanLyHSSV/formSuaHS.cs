using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyHSSV
{
    public partial class formSuaHS : Form
    {
        public static string connection = connectionString.ConnectionString;
        public formSuaHS(string id, string name, DateTime birth, string classname)
        {
            InitializeComponent();
            initClass(cbClass);
            //
            txtID.Text = id;
            txtName.Text = name;
            dateTimePicker1.Value = birth;
            cbClass.Text = classname;
        }

        private void initClass(ComboBox cb)
        {
            DataTable dt = new DataTable();
            string query = "select Lop_ten from Lop";
            using (SqlConnection conn = new SqlConnection(connection))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = query;
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Fill(dt);
                conn.Close();
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                cb.Items.Add(dt.Rows[i]["Lop_ten"].ToString());
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string query = "exec SuaHocSinh @id, @ten, @birth, @tenlop";
            using (SqlConnection conn = new SqlConnection(connection))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.Add("@id",SqlDbType.VarChar,20).Value = txtID.Text;
                cmd.Parameters.Add("@ten", SqlDbType.NVarChar, 40).Value = txtName.Text;
                cmd.Parameters.Add("@birth", SqlDbType.Date).Value = dateTimePicker1.Value;
                cmd.Parameters.Add("@tenlop", SqlDbType.VarChar, 20).Value = cbClass.SelectedItem.ToString();

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            this.Close();
        }
    }
}
