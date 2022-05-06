﻿using System;
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
    public partial class FormMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public FormMain()
        {
            InitializeComponent();
        }

        // bắt sự kiện người dùng bấm 2 lần vào 1 form.
        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;
            return null;
        }


        public void HienThiMenu()
        {
            MANV.Text = "Mã Nhân Viên: " + Program.userName;
            HoTen.Text = "Họ và tên: " + Program.nameNV;
            NHOM.Text = "Nhóm: " + Program.role;
            // Phân quyền
            if(Program.role == "CONGTY")
            {
                bntLapPhieu.Enabled = false;             
            }
            else if (Program.role == "CHINHANH")
            {
                bntLapPhieu.Enabled = false;
            }  
            else
            {
                bntLapPhieu.Enabled = false;
            }    
        }

        public void enabledBnt()
        {
            bntDangNhap.Enabled = false;
            bntDangXuat.Enabled = true;
            bntTaoTK.Enabled = true;
            pageNhanVien.Visible = pageBaoCao.Visible = true;
            if (Program.role == "USER")
                bntTaoTK.Enabled = false;
        }

        private void bnt_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void ribbonControl1_Click(object sender, EventArgs e)
        {

        }

        private void FormMain_Load(object sender, EventArgs e)
        {

        }

        private void bntDangNhap_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form f = CheckExists(typeof(FormDn));
            if (f != null)
                f.Activate();
            else
            {
                FormDn form = new FormDn();
                form.MdiParent = this;
                form.Show();
            }
        }

        private void bntThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }
        // Dispose đóng form con, thu gon rác
        private void bntDangXuat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            foreach (Form f in this.MdiChildren)
                f.Dispose();
            Program.formMain.MANV.Text = "Mã Nhân Viên";
            Program.formMain.HoTen.Text = "Họ Và Tên";
            Program.formMain.NHOM.Text = "Nhóm";
        }

        private void bntTaoTK_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
//            Form f = new FormTaoTK();
//           f.Show();
        }

        private void bntNhanVien_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form f = CheckExists(typeof(FormNhanVien));
            if (f != null)
                f.Activate();
            else
            { 
                Form from = new FormNhanVien();
//                from.MdiParent = this;
                from.Show(); 
            }
        }

        private void bntKho_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form f = CheckExists(typeof(FormKho));
            if (f != null)
                f.Activate();
            else
            {
                Form form = new FormKho();
                form.MdiParent = this;
                form.Show();
            }
        }
    }
}
