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
    public partial class BBTTask : Form
    {
        String V = "";
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                    "Trusted_Connection=yes;" +
                    "database=Publication; " +
                           "connection timeout=30";
        const string SelectQuery = "select b.ID_BAIBAO,bb.BAIPHANBIEN_ID,b.NHAKHOAHOC_ID,CONCAT(n.HO, ' ', n.TEN) as TENTACGIA,TIEUDE,FILEBAIBAO,TONGSOTRANG,TOMTAT from BAIBAO b JOIN NHAKHOAHOC n on b.NHAKHOAHOC_ID = n.NHAKHOAHOC_ID JOIN BAIPHANBIEN bb on b.ID_BAIBAO = bb.ID_BAIBAO where TRANGTHAIXULI='CHUAPHANBIEN'";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();
        SqlConnection sqlCon = new SqlConnection(myConn);
        public BBTTask(String s)
        {
            InitializeComponent();
            V = s;
            FillDataGridView();
        }

        void FillDataGridView()
        {
            datatable = new DataTable();
            using (SqlConnection con = new SqlConnection(myConn))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(SelectQuery + ";", con))
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
        private void BBTTask_Load(object sender, EventArgs e)
        {

        }

        // Change status: only CHUAPHANBIEN + Split string
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtNPB.Text == "" || txtDiadiem.Text == "" || txtNgay.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }
                else
                {
                    //One
                    SqlCommand sqlCmd = new SqlCommand("ThemPhancong_BBT_1", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@ID_BB", adgv.CurrentRow.Cells[0].Value.ToString());
                    sqlCmd.Parameters.AddWithValue("@ID_BPB", adgv.CurrentRow.Cells[1].Value.ToString());
                    sqlCmd.Parameters.AddWithValue("@diadiem", txtDiadiem.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ngayPB", txtNgay.Text.Trim());
                    sqlCmd.ExecuteNonQuery();

                    //for each
                    string[] NPBList = txtNPB.Text.Split(',');
                    foreach (string NPB in NPBList)
                    {
                        sqlCmd = new SqlCommand("ThemPhancong_BBT_2", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.AddWithValue("@ID_BB", adgv.CurrentRow.Cells[0].Value.ToString());
                        sqlCmd.Parameters.AddWithValue("@ID_BPB", adgv.CurrentRow.Cells[1].Value.ToString());
                        sqlCmd.Parameters.AddWithValue("@ID_NKH", NPB.Trim());
                        sqlCmd.ExecuteNonQuery();
                    }

                    MessageBox.Show("Submitted successfully");
                    adgv.ClearSelection();
                    FillDataGridView();
                    txtNPB.Text = "";
                    txtDiadiem.Text = "";
                    txtNgay.Text = "";
                    txtID.Text = "";
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

        private void adgv1_DoubleClick(object sender, EventArgs e)
        {
            if (adgv.CurrentRow.Index != -1)
            {
                txtID.Text = adgv.CurrentRow.Cells[1].Value.ToString();
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtNPB.Text = "";
            txtDiadiem.Text = "";
            txtNgay.Text = ""; // 7/10/2001 -- Not check larger than current time yet
        }
    }
}
