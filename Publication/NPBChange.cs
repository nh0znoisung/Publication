using System;
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
    public partial class NPBChange : Form
    {
        private String V = "";
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                                "Trusted_Connection=yes;" +
                                "database=Publication; " +
                                       "connection timeout=30";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();

        DataTable dt = new DataTable();
        //BindingSource source2 = new BindingSource();

        SqlConnection sqlCon = new SqlConnection(myConn);
        public NPBChange(String s)
        {
            InitializeComponent();
            V = s;
            // From nhakhoahoc
            String SelectNhakhoahocQuery = "select * from nhakhoahoc where NHAKHOAHOC_ID = '" + s + "'";
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

            // FROM NPB
            dt = new DataTable();
            String SelectBBTQuery = "select * from nguoiphanbien where NHAKHOAHOC_ID = '" + s + "'";
            using (SqlConnection con = new SqlConnection(myConn))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(SelectBBTQuery + ";", con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                        con.Close();
                    }
                }
            }
            txtMailCo.Text = dt.Rows[0][1].ToString();
            txtNCT.Text = dt.Rows[0][4].ToString();
            txtTrinh.Text = dt.Rows[0][3].ToString();
            txtSdt.Text = dt.Rows[0][2].ToString();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtHo.Text == "" || txtTen.Text == "" || txtTen.Text == "" || txtEmail.Text == "" || txtDiachi.Text == "" || txtChuyenmon.Text == "" || txtCoquan.Text == "" || txtNghe.Text == "" || txtMailCo.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }
                else
                {
                    SqlCommand sqlCmd = new SqlCommand("Capnhatprofile_NPB", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@ID_TG", V);
                    sqlCmd.Parameters.AddWithValue("@ho", txtHo.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ten", txtTen.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@mail", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@diachi", txtDiachi.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@chuyenmon", txtChuyenmon.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@coquancongtac", txtCoquan.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@nghenghiep", txtNghe.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@email", txtMailCo.Text.Trim());

                    sqlCmd.Parameters.AddWithValue("@sdt", txtSdt.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@trinhdo", txtTrinh.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ngaycongtac", txtNCT.Text.Trim());
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
    }
}
