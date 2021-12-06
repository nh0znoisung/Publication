﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Collections.Specialized;

namespace Publication
{
    public partial class TGChange : Form
    {
        // Use procedure for save the profile of TG
        private string V = "";
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
            "Trusted_Connection=yes;" +
            "database=Publication; " +
                   "connection timeout=30";
        private string SelectBaibaoQuery = "";
        private string SelectNhakhoahocQuery = "";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();

        DataTable dt = new DataTable();
        //BindingSource source2 = new BindingSource();

        SqlConnection sqlCon = new SqlConnection(myConn);
        public TGChange(String s)
        {
            InitializeComponent();
            V = s;
            // Get the information in the input form by NHAKHOAHOC table and ID = V
            SelectNhakhoahocQuery = "select * from nhakhoahoc where NHAKHOAHOC_ID = '" + s + "'";
            using (SqlConnection con = new SqlConnection(myConn))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(SelectNhakhoahocQuery + ";", con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                        con.Close();
                    }
                }
            }
            // After loading database
            txtHo.Text = dt.Rows[0][0].ToString();
            txtTen.Text = dt.Rows[0][1].ToString();
            txtEmail.Text = dt.Rows[0][2].ToString();
            txtDiachi.Text = dt.Rows[0][3].ToString();
            txtChuyenmon.Text = dt.Rows[0][4].ToString();
            txtCoquan.Text = dt.Rows[0][7].ToString();
            txtNghe.Text = dt.Rows[0][8].ToString();

            // Get adgv
            FillDataGridView();

            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }

        void FillDataGridView()
        {
            datatable = new DataTable();
            SelectBaibaoQuery = "select ID_BAIBAO,TRANGTHAIXULI,NGAYNHAN,TIEUDE,TONGSOTRANG,TOMTAT,FILEBAIBAO from baibao where NHAKHOAHOC_ID = '" + V + "'";
            using (SqlConnection con = new SqlConnection(myConn))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(SelectBaibaoQuery + ";", con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(datatable);
                        con.Close();
                    }
                }
            }
            DataView view1 = new DataView(datatable);
            source1.DataSource = view1;
            adgv.DataSource = source1;
        }

        private void TGChange_Load(object sender, EventArgs e)
        {

        }



        private void adgv_DoubleClick(object sender, EventArgs e)
        {
            if (adgv.CurrentRow.Index != -1)
            {
                // How to undo doubleclick
                txtTieude.Text = adgv.CurrentRow.Cells[3].Value.ToString();
                txtTomtat.Text = adgv.CurrentRow.Cells[5].Value.ToString();
                txtSotrang.Text = adgv.CurrentRow.Cells[4].Value.ToString();
                txtFile.Text = adgv.CurrentRow.Cells[6].Value.ToString();
                btnAdd.Enabled = false;
                btnDelete.Enabled = true;
                btnUpdate.Enabled = true;
            }
        }

        private void txtSotrang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void adgv_FilterStringChanged(object sender, EventArgs e)
        {
            source1.Filter = adgv.FilterString; // query example = "id = 10"
        }

        private void adgv_SortStringChanged(object sender, EventArgs e)
        {
            source1.Sort = adgv.SortString;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            // Save and update the information of TG
            // Using query or procedure
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtHo.Text == "" || txtTen.Text == "" || txtTen.Text == "" || txtEmail.Text == "" || txtDiachi.Text == "" || txtChuyenmon.Text == "" || txtCoquan.Text == "" || txtNghe.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }
                else
                {
                    SqlCommand sqlCmd = new SqlCommand("Capnhatprofile_TG", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@ID_TG", V);
                    sqlCmd.Parameters.AddWithValue("@ho", txtHo.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ten", txtTen.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@mail", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@diachi", txtDiachi.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@chuyenmon", txtChuyenmon.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@coquancongtac", txtCoquan.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@nghenghiep", txtNghe.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    MessageBox.Show("Saved successfully");
                }
                //Reset();
                //FillDataGridView();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message");
            }
            finally
            {
                sqlCon.Close();
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            // Add, Insert
            // '2001-07-10' 
            DateTime dateTime = DateTime.UtcNow.Date;
            String s = dateTime.ToString("yyyy-dd-MM");

            Random r = new Random();
            int rInt = r.Next(10000, 99999); //for ints
            String l = "a" + rInt.ToString();

            Random r1 = new Random();
            int rInt1 = r1.Next(100000, 999999); //for ints
            String l1 = rInt1.ToString();

            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtTieude.Text == "" || txtTomtat.Text == "" || txtSotrang.Text == "" || txtFile.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }
                else
                {
                    SqlCommand sqlCmd = new SqlCommand("ThemBaibao_TG", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@ID_BB", l);
                    sqlCmd.Parameters.AddWithValue("@ID_BPB", l1);
                    sqlCmd.Parameters.AddWithValue("@trangthaixuli", "CHUAPHANBIEN");
                    sqlCmd.Parameters.AddWithValue("@file", txtFile.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@tieude", txtTieude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@tomtat", txtTomtat.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@sotrang", Convert.ToInt32(txtSotrang.Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("@nhakhochocID", V);
                    sqlCmd.Parameters.AddWithValue("@ngaynhan", s);
                    sqlCmd.ExecuteNonQuery();

                    MessageBox.Show("Added successfully");
                    FillDataGridView();
                    adgv.ClearSelection();
                    btnAdd.Enabled = true;
                    txtTieude.Text = "";
                    txtTomtat.Text = "";
                    txtSotrang.Text = "";
                    txtFile.Text = "";
                    btnDelete.Enabled = false;
                    btnUpdate.Enabled = false;
                }
                //Reset();
                //FillDataGridView();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message");
            }
            finally
            {
                sqlCon.Close();
            }

        }
        private void btnClear_Click(object sender, EventArgs e)
        {
            adgv.ClearSelection();
            btnAdd.Enabled = true;
            txtTieude.Text = "";
            txtTomtat.Text = "";
            txtSotrang.Text = "";
            txtFile.Text = "";
            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (adgv.CurrentRow.Cells[1].Value.ToString() != "CHUAPHANBIEN")
            {
                MessageBox.Show("Cannot delete due to the state of the article");
                return;
            }
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("XoaBaibao_TG", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@ID_BB", adgv.CurrentRow.Cells[0].Value.ToString());
                sqlCmd.ExecuteNonQuery();
                MessageBox.Show("Deleted successfully");

                FillDataGridView();
                adgv.ClearSelection();
                btnAdd.Enabled = true;
                txtTieude.Text = "";
                txtTomtat.Text = "";
                txtSotrang.Text = "";
                txtFile.Text = "";
                btnDelete.Enabled = false;
                btnUpdate.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message");
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtTieude.Text == "" || txtTomtat.Text == "" || txtSotrang.Text == "" || txtFile.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }else if(adgv.CurrentRow.Cells[1].Value.ToString() != "CHUAPHANBIEN")
                {
                    MessageBox.Show("Cannot update due to the state of the article");
                }
                else
                {
                    SqlCommand sqlCmd = new SqlCommand("CapnhatBaibao_TG", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@ID_BB", adgv.CurrentRow.Cells[0].Value.ToString());
                    sqlCmd.Parameters.AddWithValue("@file", txtFile.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@tieude", txtTieude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@tomtat", txtTomtat.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@sotrang", Convert.ToInt32(txtSotrang.Text.Trim()));
                    sqlCmd.ExecuteNonQuery();
                    MessageBox.Show("Updated successfully");

                    FillDataGridView();
                    adgv.ClearSelection();
                    btnAdd.Enabled = true;
                    txtTieude.Text = "";
                    txtTomtat.Text = "";
                    txtSotrang.Text = "";
                    txtFile.Text = "";
                    btnDelete.Enabled = false;
                    btnUpdate.Enabled = false;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error Message");
            }
            finally
            {
                sqlCon.Close();
            }
        }
    }
}
