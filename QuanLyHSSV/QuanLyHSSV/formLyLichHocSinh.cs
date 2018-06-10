using QuanLyHSSV.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyHSSV
{
    public partial class formLyLichHocSinh : Form
    {
        private SinhVien sinhvien;
        public formLyLichHocSinh(SinhVien sv)
        {
            InitializeComponent();
            this.Sinhvien = sv;
            LoadThongtin();
        }

        private void LoadThongtin()
        {
            txtMaSV.Text = Sinhvien.Hs_id;
            txtHoTen.Text = Sinhvien.Hs_ten;
        }

        public SinhVien Sinhvien
        {
            get
            {
                return sinhvien;
            }

            set
            {
                sinhvien = value;
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        #region Event
        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion


    }
}
