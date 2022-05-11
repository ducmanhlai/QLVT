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
    public partial class FormPhieuNhap : Form
    {
        int vitri = 0;
        int chedo = 0; // 0 là phiếu nhập, 1 là chi tiết phiếu nhập
        bool dangThem = false;
        

        public FormPhieuNhap()
        {
            InitializeComponent();
        }

        private void phieuNhapBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsPN.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void FormPhieuNhap_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            // TODO: This line of code loads data into the 'dS.Vattu' table. You can move, or remove it, as needed.
            this.vattuTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.vattuTableAdapter.Fill(this.dS.Vattu);
            // TODO: This line of code loads data into the 'dS.Kho' table. You can move, or remove it, as needed.
            this.khoTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.khoTableAdapter.Fill(this.dS.Kho);
            // TODO: This line of code loads data into the 'dS.HoTenNV' table. You can move, or remove it, as needed.
            this.hoTenNVTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.hoTenNVTableAdapter.Fill(this.dS.HoTenNV);
            // TODO: This line of code loads data into the 'dS.PhieuNhap' table. You can move, or remove it, as needed.
            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
            // TODO: This line of code loads data into the 'dS.CTPN' table. You can move, or remove it, as needed.
            this.cTPNTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.cTPNTableAdapter.Fill(this.dS.CTPN);
            cbbChiNhanh.DataSource = Program.bindingSource;
            cbbChiNhanh.DisplayMember = "TENCN";
            cbbChiNhanh.ValueMember = "TENSERVER";
            cbbChiNhanh.SelectedIndex = Program.CN;
            cbbChiNhanh.Enabled = false;
        }

        private void cbbHoTenNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            try 
            {
                txtMaNV.Text = cbbHoTenNV.SelectedValue.ToString();
            }
            catch(Exception ex)
            {
                //MessageBox.Show("Lỗi lấy mã nhân viên " + ex.Message, "", MessageBoxButtons.OK);
                //return;
            }
        }

        private void cbbTenKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtMaKho.Text = cbbTenKho.SelectedValue.ToString();
            }
            catch(Exception ex)
            {
                //MessageBox.Show("Lỗi lấy mã kho " + ex.Message, "", MessageBoxButtons.OK);
                //return;
            }
        }

        private void mANVLabel_Click(object sender, EventArgs e)
        {

        }

        private void panelControl2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnthem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(chedo == 0)
            {
                dangThem = true;
                vitri = bdsPN.Position;
                panelControl2.Enabled = true;
                // thêm mới
                bdsPN.AddNew();
                btnthem.Enabled = btnReset.Enabled = btnThoat.Enabled = btnHieuChinh.Enabled = btnXoa.Enabled = bsChonCheDo.Enabled = false;
                btnLuu.Enabled = btnPhucHoi.Enabled = true;
                deNgay.EditValue = DateTime.Now;

            }
            else
            {
                if(teMaPN == null)
                {
                    MessageBox.Show("Mã phiếu nhập không thể để trống!", "", MessageBoxButtons.OK);
                    return;
                }
                btnHieuChinh.Enabled = btnReset.Enabled = btnThoat.Enabled = btnXoa.Enabled = btnthem.Enabled = false;
                btnLuu.Enabled = btnPhucHoi.Enabled = true;
                bdsCTPN.AddNew();
                ((DataRowView)bdsCTPN[bdsCTPN.Position])["MAPN"] = teMaPN.Text; 
            }    
        }

        private void txtMaKho_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtMaNV_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnPhucHoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsPN.CancelEdit();
            if (btnthem.Enabled == false)
                bdsPN.Position = vitri;
            btnthem.Enabled = btnReset.Enabled = btnThoat.Enabled = btnXoa.Enabled = btnHieuChinh.Enabled = bsChonCheDo.Enabled = true;
            btnPhucHoi.Enabled = btnLuu.Enabled = false;
            gcPN.Enabled = true;
            panelControl2.Enabled = false;
        }

        private void btnReset_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi reset: " + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }

        /*
         * Bước 1: kiểm tra số phiếu nhập > 0 mới cho xóa
         * Bước 2: kiểm tra phiếu nhập đã có CTPN chưa
         * Bước 3: xóa
         */
        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(chedo == 0)
            {
                string mapn = "";
                if (bdsPN.Count == 0)
                {
                    MessageBox.Show("Không có phiếu nhập nào để xóa", "", MessageBoxButtons.OK);
                    return;
                }
                if (bdsCTPN.Count > 0)
                {
                    MessageBox.Show("Không thể xóa phiếu nhập đã  tồn tại ");
                    return;
                }
                if (MessageBox.Show("Bạn thật sự muốn xóa phiếu nhập này?", "Xác nhận", MessageBoxButtons.OKCancel)
                    == DialogResult.OK)
                {
                    try
                    {
                        mapn = ((DataRowView)bdsPN[bdsPN.Position])["MAPN"].ToString();
                        bdsPN.RemoveCurrent();
                        this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connectionString;
                        this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi xóa phiếu nhập " + ex.Message, "", MessageBoxButtons.OK);
                        this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                        bdsPN.Position = bdsPN.Find("MAPN", mapn);
                        return;
                    }
                }
            }
            else
            {
                int vtxoa = bdsCTPN.Position;
                if(bdsCTPN.Count == 0)
                {
                    MessageBox.Show("Không có chi tiết phiếu nhập nào để xóa!", "", MessageBoxButtons.OK);
                    return;
                } 
                if(MessageBox.Show("Bạn thật sự muốn xóa chi tiết phiếu nhập này?", "Xác nhận", MessageBoxButtons.OKCancel)
                    == DialogResult.OK)
                {
                    try
                    {
                        bdsCTPN.RemoveCurrent();
                        this.cTPNTableAdapter.Connection.ConnectionString = Program.connectionString;
                        this.cTPNTableAdapter.Update(this.dS.CTPN);
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show("Lỗi xóa chi tiết phiếu nhập!" + ex.Message, "", MessageBoxButtons.OK);
                        this.cTPNTableAdapter.Fill(this.dS.CTPN);
                        bdsCTPN.Position = vtxoa;
                        return;
                    }
                }    
            }
        }

        private void btnHieuChinh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(chedo == 0)
            {
                gcPN.Enabled = false;
                panelControl2.Enabled = true;
                teMaPN.Enabled = false;
                btnHieuChinh.Enabled = btnReset.Enabled = btnThoat.Enabled = btnXoa.Enabled = btnthem.Enabled = false;
                btnLuu.Enabled = btnPhucHoi.Enabled = true;
            }
            else
            {
                btnHieuChinh.Enabled = btnReset.Enabled = btnThoat.Enabled = btnXoa.Enabled = btnthem.Enabled = false;
                btnLuu.Enabled = btnPhucHoi.Enabled = true;
            }    
        }
        /*
         * B1: Kiểm tra định dạng
         * B2: Kiêm tra xem mã PN đã trùng chưa?
         * b3: lưu vào csdl
         */
        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(chedo == 0)
            {
                if(txtMaNV.Text.Trim() == "")
                {
                    MessageBox.Show("Không thể bỏ trống mã nhân viên!", "", MessageBoxButtons.OK);
                    cbbHoTenNV.Focus();
                    return;
                }
                if(txtMaKho.Text.Trim() == "")
                {
                    MessageBox.Show("Không thể bỏ trống mã kho!", "", MessageBoxButtons.OK);
                    cbbTenKho.Focus();
                    return;
                }
                /*
                 * Declare @status int
                 * EXEC @status = SP_KIEMTRAMAPN 'tePN'
                 * select @status
                 */
                string strLenh = "Declare @status int "
                                 + "EXEC @status = SP_KIEMTRAMAPN "
                                 + "'"
                                 + teMaPN.Text
                                 + "' "
                                 + "select @status";
                Program.myReader = Program.ExecSqlDataReader(strLenh);
                Program.myReader.Read();
                int status = int.Parse(Program.myReader.GetValue(0).ToString());
                Program.myReader.Close();
                if(status == 1)
                {
                    MessageBox.Show("Mã phiếu nhập đã tồn tại!", "", MessageBoxButtons.OK);
                    return;
                }
                if(dangThem == true)
                {
                    if (MessageBox.Show("Bạn thật sự muốn thêm phiếu nhập này?", "Xác nhận", MessageBoxButtons.OKCancel)
                        == DialogResult.OK)
                    {
                        try
                        {
                            bdsPN.EndEdit();
                            bdsPN.ResetCurrentItem();
                            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connectionString;
                            this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);
                            dangThem = false;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Lỗi lưu phiếu nhập " + ex.Message, "", MessageBoxButtons.OK);
                            return;
                        }
                    }
                }
                else
                {
                    if (MessageBox.Show("Bạn thật sự muốn thay đổi nhân viên này?", "Xác nhận", MessageBoxButtons.OKCancel)
                        == DialogResult.OK)
                    {
                        try
                        {
                            bdsPN.EndEdit();
                            bdsPN.ResetCurrentItem();
                            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connectionString;
                            this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);
                            //dangThem = false;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Lỗi lưu phiếu nhập " + ex.Message, "", MessageBoxButtons.OK);
                            return;
                        }
                    }
                }
            }
        }

        private void cbbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView")
                return;
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
            if(Program.KetNoi() == 0)
            {
                MessageBox.Show("Lỗi kết nối về chi nhánh mới!", "", MessageBoxButtons.OK);
                return;
            }
            else
            {
                // TODO: This line of code loads data into the 'dS.Vattu' table. You can move, or remove it, as needed.
                this.vattuTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.vattuTableAdapter.Fill(this.dS.Vattu);
                // TODO: This line of code loads data into the 'dS.Kho' table. You can move, or remove it, as needed.
                this.khoTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.khoTableAdapter.Fill(this.dS.Kho);
                // TODO: This line of code loads data into the 'dS.HoTenNV' table. You can move, or remove it, as needed.
                this.hoTenNVTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.hoTenNVTableAdapter.Fill(this.dS.HoTenNV);
                // TODO: This line of code loads data into the 'dS.PhieuNhap' table. You can move, or remove it, as needed.
                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                // TODO: This line of code loads data into the 'dS.CTPN' table. You can move, or remove it, as needed.
                this.cTPNTableAdapter.Connection.ConnectionString = Program.connectionString;
                this.cTPNTableAdapter.Fill(this.dS.CTPN);
            }    
        }
    }
}
