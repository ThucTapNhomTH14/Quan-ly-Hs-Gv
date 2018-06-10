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
        public formSuaHS(string id,string name,DateTime birth)
        {
            InitializeComponent();
            txtID.Text = id;
            txtName.Text = name;
            dateTimePicker_birthday.Value = birth;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnConfirm_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString.ConnectionString))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "exec SuaGiaoVien @id, @ten, @birth";
                cmd.Parameters.Add("@id", SqlDbType.VarChar, 20).Value = txtID.Text;
                cmd.Parameters.Add("@ten", SqlDbType.NVarChar, 40).Value = txtName.Text;
                cmd.Parameters.Add("@birth", SqlDbType.Date).Value = dateTimePicker_birthday.Value.Date;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            this.Close();
        }
    }
}
