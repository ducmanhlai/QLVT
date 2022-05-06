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

        private void bindingSource1_CurrentChanged(object sender, EventArgs e)
        {

        }

        private void FormKho_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            KhoTA.Connection.ConnectionString = Program.connectionString;
            this.KhoTA.Fill(this.dS.Kho);
            macn = ((DataRowView)BdsKho[0])["MACN"].ToString();
            cbbChiNhanh.DataSource = Program.bindingSource;
            cbbChiNhanh.DisplayMember = "TENCN";
            cbbChiNhanh.ValueMember = "TENSERVER";
            cbbChiNhanh.SelectedIndex = Program.CN;
            cbbChiNhanh.Enabled = false;
        }

        private void dIACHITextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}
