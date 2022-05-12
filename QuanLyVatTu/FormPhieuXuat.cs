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
    public partial class FormPhieuXuat : Form
    {
        int viTri = 0;
        bool dangThem = false;
        public FormPhieuXuat()
        {
            InitializeComponent();
        }

        private void phieuXuatBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsPX.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void FormPhieuXuat_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            // TODO: This line of code loads data into the 'dS.HoTenNV' table. You can move, or remove it, as needed.
            this.hoTenNVTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.hoTenNVTableAdapter.Fill(this.dS.HoTenNV);
            // TODO: This line of code loads data into the 'dS.Kho' table. You can move, or remove it, as needed.
            this.khoTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.khoTableAdapter.Fill(this.dS.Kho);
            // TODO: This line of code loads data into the 'dS.CTPX' table. You can move, or remove it, as needed.
            this.cTPXTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.cTPXTableAdapter.Fill(this.dS.CTPX);
            // TODO: This line of code loads data into the 'dS.PhieuXuat' table. You can move, or remove it, as needed.
            this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
            cbbChiNhanh.DataSource = Program.bindingSource;
            cbbChiNhanh.DisplayMember = "TENCN";
            cbbChiNhanh.ValueMember = "TENSERVER";
            cbbChiNhanh.SelectedIndex = Program.CN;
            cbbChiNhanh.Enabled = false;
            if(Program.role == "CONGTY")
            {
                cbbChiNhanh.Enabled = true;
                btnHieuChinh.Enabled = btnthem.Enabled = btnXoa.Enabled = btnLuu.Enabled = btnPhucHoi.Enabled = false;
                panelControl3.Enabled = false;
            }    
        }

        private void hOTENComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            try 
            { 
                if(cbbHoTenNV.SelectedValue != null)
                {
                    txtMaNV.Text = cbbHoTenNV.SelectedValue.ToString();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi lấy mã nhân viên " + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }

        private void cbbTenKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cbbTenKho.SelectedValue != null)
                {
                    txtMaKho.Text = cbbTenKho.SelectedValue.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi lấy mã kho " + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnReset_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi kết nối về server!", "", MessageBoxButtons.OK);
                return;
            }
        }

        private void btnPhucHoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsPX.CancelEdit();
            if (btnthem.Enabled == false)
                bdsPX.Position = viTri;
            btnthem.Enabled = btnXoa.Enabled = btnHieuChinh.Enabled = btnReset.Enabled = btnThoat.Enabled = true;
            btnPhucHoi.Enabled = btnLuu.Enabled = false;
            gcPX.Enabled = true;
            panelControl2.Enabled = false;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string mapx = "";
            if (bdsPX.Count == 0)
            {
                MessageBox.Show("Không có phiếu xuất nào để xóa!", "", MessageBoxButtons.OK);
                return;
            }
            if(bdsCTPX.Count > 0)
            {
                MessageBox.Show("Không thể xóa Phiếu xuất đã lập chi tiết phiếu xuất!", "", MessageBoxButtons.OK);
                return;
            }
            if(MessageBox.Show("Bạn thật sự muốn xóa phiếu xuất này?","Xác Nhận", MessageBoxButtons.OKCancel)
                == DialogResult.OK)
            {
                try 
                {
                    mapx = ((DataRowView)bdsPX[bdsPX.Position])["MAPX"].ToString();
                    bdsPX.RemoveCurrent();
                    this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connectionString;
                    this.phieuXuatTableAdapter.Update(this.dS.PhieuXuat);
                }
                catch(Exception ex)
                {
                    MessageBox.Show("Lỗi xóa phiếu xuất " + ex.Message, "", MessageBoxButtons.OK);
                    this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
                    bdsPX.Position = bdsPX.Find("MAPX", mapx);
                }
            }    
        }

        private void btnHieuChinh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelControl2.Enabled = true;
            gcPX.Enabled = false;
            btnHieuChinh.Enabled = btnthem.Enabled = btnReset.Enabled = btnXoa.Enabled = btnThoat.Enabled = false;
            btnLuu.Enabled = btnPhucHoi.Enabled = true;
            teMaPX.Enabled = false;
        }

        private void btnthem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsPX.AddNew();
            dangThem = true;
            gcPX.Enabled = false;
            teMaPX.Enabled = true;
            btnthem.Enabled = btnXoa.Enabled = btnHieuChinh.Enabled = btnReset.Enabled = btnThoat.Enabled = false;
            btnLuu.Enabled = btnPhucHoi.Enabled = true;
            panelControl2.Enabled = true;
            panelControl3.Enabled = false;
            gcCTPX.Enabled = false;
        }

        private void cbbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView")
                return;
            Program.serverName = cbbChiNhanh.SelectedValue.ToString();
            if(cbbChiNhanh.SelectedIndex != Program.CN)
            {
                Program.loginName = Program.remoteLogin;
                Program.password = Program.remotePassword;
            }
            else
            {
                Program.loginName = Program.loginDN;
                Program.password = Program.passworDN;
            }
            if (Program.KetNoi() == 0)
                MessageBox.Show("Lỗi kết nối về chi nhánh mới!", "", MessageBoxButtons.OK);
            else
            {
                // TODO: This line of code loads data into the 'dS.HoTenNV' table. You can move, or remove it, as needed.
                this.hoTenNVTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.hoTenNVTableAdapter.Fill(this.dS.HoTenNV);
                // TODO: This line of code loads data into the 'dS.Kho' table. You can move, or remove it, as needed.
                this.khoTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.khoTableAdapter.Fill(this.dS.Kho);
                // TODO: This line of code loads data into the 'dS.CTPX' table. You can move, or remove it, as needed.
                this.cTPXTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.cTPXTableAdapter.Fill(this.dS.CTPX);
                // TODO: This line of code loads data into the 'dS.PhieuXuat' table. You can move, or remove it, as needed.
                this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
            }
        }

        private void sbtnThem_Click(object sender, EventArgs e)
        {
            bdsCTPX.AddNew();

        }
    }
}
