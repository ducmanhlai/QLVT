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
    public partial class FormKho : Form
    {
        int vitri = 0;
        string macn = "";

        public FormKho()
        {
            InitializeComponent();
        }

        

        private void FormKho_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            KhoTA.Connection.ConnectionString = Program.connectionString;
            this.KhoTA.Fill(this.dS.Kho);
            macn = ((DataRowView)BdsKho[0])["MACN"].ToString();
            textBox1.Text = macn;
            cbbChiNhanh.DataSource = Program.bindingSource;
            cbbChiNhanh.DisplayMember = "TENCN";
            cbbChiNhanh.ValueMember = "TENSERVER";
            cbbChiNhanh.SelectedIndex = Program.CN;
            cbbChiNhanh.Enabled = false;
            if (Program.role == "CONGTY")
            {
                cbbChiNhanh.Enabled = true;
                btnLamLai.Enabled = btnHieuChinh.Enabled = btnthem.Enabled = btnXoa.Enabled = btnLuu.Enabled = btnPhucHoi.Enabled = false;
            }

        }

        private void dIACHITextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void btnthem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnHieuChinh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            vitri = BdsKho.Position;
            GridKho.Enabled = false;
            panelControl2.Enabled = true;
            btnHieuChinh.Enabled = btnIDSNV.Enabled = btnLamLai.Enabled = btnReset.Enabled = btnThoat.Enabled = btnthem.Enabled = btnXoa.Enabled = false;
            btnLuu.Enabled = btnPhucHoi.Enabled = true;
        }

        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void btnPhucHoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            BdsKho.CancelEdit();
            if (!btnthem.Enabled) BdsKho.Position = vitri;
            GridKho.Enabled = true;
            panelControl2.Enabled = false;
            btnHieuChinh.Enabled = btnIDSNV.Enabled = btnLamLai.Enabled = btnReset.Enabled = btnThoat.Enabled = btnthem.Enabled = btnXoa.Enabled = true;
            btnLuu.Enabled = btnPhucHoi.Enabled = false;

        }

        private void btnReset_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                this.KhoTA.Fill(this.dS.Kho);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi khi làm mới dữ liệu/n " + ex.Message, "", MessageBoxButtons.OK);
            }
        }

        private void cbbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView")
                return;
            Program.serverName = cbbChiNhanh.SelectedValue.ToString();

            if (cbbChiNhanh.SelectedIndex != Program.CN)
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
                
                KhoTA.Connection.ConnectionString = Program.connectionString;
                this.KhoTA.Fill(this.dS.Kho);
                macn = ((DataRowView)BdsKho[0])["MACN"].ToString();
                textBox1.Text = macn;
            }
        }
        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }
        private void label2_Click(object sender, EventArgs e)
        {

        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void mAKHOTextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void tENKHOTextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}
