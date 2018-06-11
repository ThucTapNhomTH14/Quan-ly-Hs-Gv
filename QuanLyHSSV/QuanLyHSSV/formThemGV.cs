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
    public partial class formThemGV : Form
    {
        public formThemGV()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_confirm_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(connectionString.ConnectionString))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "exec ThemGiaoVien @ten, @birth";
                
                //sua lai proc them giao vien nvarchar(40) nhe nvarchar trong proc co 20 thoi
                cmd.Parameters.Add("@ten", SqlDbType.NVarChar, 40).Value = txt_name.Text;
                cmd.Parameters.Add("@birth", SqlDbType.Date).Value = dateTimePicker_birthday.Value.Date;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();               
            }
            this.Close();
        }
    }
}
