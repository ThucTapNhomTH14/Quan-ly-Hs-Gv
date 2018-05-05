﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyHSSV
{
    public partial class Main : Form
    {
        public static string connection = connectionString.ConnectionString;
        public Main()
        {
            InitializeComponent();
            toggle_GV_off();
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        /*/////////////////////////////////////////////////////////////////////////////
        MODULE GIAO VIEN 
        */
        //xem list GV
        private void hồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toggle_GV_on();
            refresh_GV(-1);
        }
        //refresh dgv
        private void refresh_GV(int row)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = con.CreateCommand();
                //select tu View nen phai chay query tao view nhe
                cmd.CommandText = "select * from GV";

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Fill(dt);
                mainDGV.DataSource = dt;
                con.Close();
            }
            if (row == 1 || row == -1)
            {
                mainDGV.Rows[0].Selected = true;
            }
            else if (row != 0)
            {
                mainDGV.Rows[row - 1].Selected = true;
            }           
        }
        //them giao vien
        private void GV_btn_add_Click(object sender, EventArgs e)
        {
            formThemGV f = new formThemGV();
            f.ShowDialog();
            refresh_GV(mainDGV.Rows.Count);
        }

        //toggle GV component visibility
        private void toggle_GV_on()
        {
            GV_btn_add.Visible = true;
            GV_btn_delete.Visible = true;
            GV_btn_update.Visible = true;
            GV_txtSearch.Visible = true;
        }
        private void toggle_GV_off()
        {
            GV_btn_add.Visible = false;
            GV_btn_delete.Visible = false;
            GV_btn_update.Visible = false;
            GV_txtSearch.Visible = false;
        }

        private void GV_btn_delete_Click(object sender, EventArgs e)
        {
            int row = mainDGV.CurrentCell.RowIndex;
            string id = mainDGV.Rows[row].Cells[0].Value.ToString();
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "exec XoaGiaoVien @id";
                cmd.Parameters.Add("@id", SqlDbType.VarChar, 20).Value = id;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            refresh_GV(row - 1);
        }

        private void GV_txtSearch_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = con.CreateCommand();
                /*
                 bug thi phai chay cai nay trong sql:

                 ALTER proc [dbo].[TimGiaoVien](@string varchar(40))
                    as
                    begin
                    select * from GV as A
                    where A.[Mã giáo viên] like N'%'+@string+N'%' or A.[Tên giáo viên] like N'%'+@string+N'%' or A.[Ngày sinh] like N'%'+@string+N'%'
                    end
                 */
                cmd.CommandText = "exec TimGiaoVien @string";
                cmd.Parameters.Add("@string", SqlDbType.VarChar, 20).Value = GV_txtSearch.Text;

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Fill(dt);
                mainDGV.DataSource = dt;
                con.Close();
            }
        }

        private void GV_btn_update_Click(object sender, EventArgs e)
        {
            int row = mainDGV.CurrentCell.RowIndex;
            string id = mainDGV.Rows[row].Cells[0].Value.ToString();
            string name = mainDGV.Rows[row].Cells[1].Value.ToString();
            string bd = mainDGV.Rows[row].Cells[2].Value.ToString();
            DateTime birth;
            DateTime.TryParseExact(bd, "dd/MM/yyyy", null, DateTimeStyles.None, out birth);
            formSuaGV f = new formSuaGV(id, name, birth);
            f.ShowDialog();
            refresh_GV(row);
        }

        //////////////////////////////////////////////////////////////////////////
    }
}
