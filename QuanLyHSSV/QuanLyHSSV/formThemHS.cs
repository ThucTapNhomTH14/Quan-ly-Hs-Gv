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
    public partial class formThemHS : Form
    {
        public formThemHS()
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
                cmd.CommandText = "exec ThemGiaoVien @id, @ten, @birth";
                cmd.Parameters.Add("@id", SqlDbType.VarChar, 20).Value = txt_ID.Text;
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
