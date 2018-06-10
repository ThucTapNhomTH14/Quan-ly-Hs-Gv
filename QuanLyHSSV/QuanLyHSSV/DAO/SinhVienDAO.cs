using QuanLyHSSV.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyHSSV.DAO
{
    public class SinhVienDAO
    {
        private static SinhVienDAO instance;

        public static SinhVienDAO Instance
        {
            get
            {
                if (instance == null) instance = new SinhVienDAO(); return instance;
            }

            private set
            {
                instance = value;
            }

        }

        private SinhVienDAO() { }

        public SinhVien GetSinhVienByID(string id)
        {
            SinhVien sv = null;

            DataTable data = DataProvider.Instance.ExcuteQuery("EXEC dbo.GetsinhVienByID @id", new object[] { id});

            foreach (DataRow item in data.Rows)
            {
                sv = new SinhVien(item);
            }
            return sv;
        }
    }
}
