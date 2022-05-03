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
    public partial class FormMain : Form
    {
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

        public FormMain()
        {
            InitializeComponent();
        }

        private void bnt_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void bntCTPX_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void ribbonControl1_Click(object sender, EventArgs e)
        {

        }

        private void FormMain_Load(object sender, EventArgs e)
        {

        }
    }
}
