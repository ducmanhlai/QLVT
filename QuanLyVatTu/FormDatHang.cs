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
    public partial class FormDatHang : Form
    {
        public FormDatHang()
        {
            InitializeComponent();
        }

        private void FormDatHang_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            datHangTableAdapter.Connection.ConnectionString = Program.connectionString;
            // TODO: This line of code loads data into the 'dS.DatHang' table. You can move, or remove it, as needed.
            this.datHangTableAdapter.Fill(this.dS.DatHang);
            // TODO: This line of code loads data into the 'dS.CTDDH' table. You can move, or remove it, as needed.
            cTDDHTableAdapter.Connection.ConnectionString = Program.connectionString;
            this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
            khoTableAdapter.Connection.ConnectionString = Program.connectionString;
            // TODO: This line of code loads data into the 'dS.Kho' table. You can move, or remove it, as needed.
            this.khoTableAdapter.Fill(this.dS.Kho);
            

        }
    }
}