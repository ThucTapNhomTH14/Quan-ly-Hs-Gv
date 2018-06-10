using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHSSV.DTO
{
    public class SinhVien
    {
        private string hs_id;
        private string hs_ten;
        private string lop_ID;

        public SinhVien(DataRow row )
        {
            this.Hs_id = (string)row["hs_id"];
            this.Hs_ten = (string)row["hs_ten"];         
            this.Lop_ID = (string)row["lop_id"];
        }

        public string Hs_id
        {
            get
            {
                return hs_id;
            }

            set
            {
                hs_id = value;
            }
        }

        public string Hs_ten
        {
            get
            {
                return hs_ten;
            }

            set
            {
                hs_ten = value;
            }
        }


        public string Lop_ID
        {
            get
            {
                return lop_ID;
            }

            set
            {
                lop_ID = value;
            }
        }
    }
}
