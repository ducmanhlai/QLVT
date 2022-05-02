using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyVatTu
{
    public partial class FormNhanVien : Form
    {
        public FormNhanVien()
        {
            InitializeComponent();
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void nhanVienBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsNV.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void FormNhanVien_Load(object sender, EventArgs e)
        {
            /*không kiểm tra khóa ngoại nữa*/
            dS.EnforceConstraints = false;
            nhanVienTableAdapter.Connection.ConnectionString = Program.connectionStringPublisher;
            this.nhanVienTableAdapter.Fill(this.dS.NhanVien);

            nhanVienTableAdapter.Connection.ConnectionString = Program.connectionStringPublisher;
            this.datHangTableAdapter.Fill(this.dS.DatHang);

            nhanVienTableAdapter.Connection.ConnectionString = Program.connectionStringPublisher;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);

            nhanVienTableAdapter.Connection.ConnectionString = Program.connectionStringPublisher;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
        }

        private void lUONGTextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void lUONGLabel_Click(object sender, EventArgs e)
        {

        }

        private void trangThaiXoaCheckBox_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void txtMANV_TextChanged(object sender, EventArgs e)
        {

        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
    }
}
