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
    public partial class NPBTask : Form
    {
        private String V = "";
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                    "Trusted_Connection=yes;" +
                    "database=Publication; " +
                           "connection timeout=30";
        string SelectQuery = "";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();
        SqlConnection sqlCon = new SqlConnection(myConn);
        public NPBTask(String s)
        {
            InitializeComponent();
            V = s;
            FillDataGridView();
        }
        void FillDataGridView()
        {
            DataTable datatable = new DataTable();
            SelectQuery = "select BAIPHANBIEN_ID,t.ID_BAIBAO,b.NHAKHOAHOC_ID as ID_TENTACGIA,CONCAT(n.HO, ' ', n.TEN) as TENTACGIA,TIEUDE from THUCHIENPHANBIEN t join BAIBAO b on t.ID_BAIBAO = b.ID_BAIBAO join NHAKHOAHOC n on n.NHAKHOAHOC_ID = b.NHAKHOAHOC_ID where (SELECT COUNT(*) FROM THUCHIENPHANBIEN_TIEUCHIPHANBIEN where MOTA='HINHTHUC' and BAIPHANBIEN_ID=t.BAIPHANBIEN_ID and ID_BAIBAO=t.ID_BAIBAO and NHAKHOAHOC_ID=t.NHAKHOAHOC_ID) = 0 and t.NHAKHOAHOC_ID='" + V + "'";
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
        bool check(String s)
        {
            if(Convert.ToInt32(s) >= 1 && Convert.ToInt32(s) <= 100)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                if (txtHinhthuc.Text == "" || txtChinhxac.Text == "" || txtKhathi.Text == "" || txtThuyetphuc.Text == "")
                {
                    MessageBox.Show("Cannot blank any information");
                }else if (check(txtHinhthuc.Text) == false || check(txtChinhxac.Text) == false || check(txtKhathi.Text) == false || check(txtThuyetphuc.Text) == false)
                {
                    MessageBox.Show("Some numbers are out of range");
                }
                else
                {
                    //for each
                   // SqlCommand sqlCmd = new SqlCommand();
                    List<string> motaList = new List<string>(new string[] { "HINHTHUC", "TINHCHINHXAC", "TINHKHATHI", "TINHTHUYETPHUC" });

                    for(int i = 0; i<4; i++)
                    {
                        SqlCommand sqlCmd = new SqlCommand("ThemChamdiem_NPB", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.AddWithValue("@mota", motaList[i]);
                        if (i == 0)
                        {
                            sqlCmd.Parameters.AddWithValue("@diem", Convert.ToInt32(txtHinhthuc.Text.ToString()));
                        }
                        else if (i == 1)
                        {
                            sqlCmd.Parameters.AddWithValue("@diem", Convert.ToInt32(txtChinhxac.Text.ToString()));
                        }
                        else if (i == 2)
                        {
                            sqlCmd.Parameters.AddWithValue("@diem", Convert.ToInt32(txtKhathi.Text.ToString()));
                        }
                        else
                        {
                            sqlCmd.Parameters.AddWithValue("@diem", Convert.ToInt32(txtThuyetphuc.Text.ToString()));
                        }
                        sqlCmd.Parameters.AddWithValue("@ID_BB", adgv.CurrentRow.Cells[1].Value.ToString());
                        sqlCmd.Parameters.AddWithValue("@ID_BPB", adgv.CurrentRow.Cells[0].Value.ToString());
                        sqlCmd.Parameters.AddWithValue("@ID_NKH", V);

                        sqlCmd.ExecuteNonQuery();
                    }

                    MessageBox.Show("Submitted successfully");
                    adgv.ClearSelection();
                    FillDataGridView();
                    txtHinhthuc.Text = ""; //check 1-100
                    txtChinhxac.Text = "";
                    txtKhathi.Text = "";
                    txtThuyetphuc.Text = "";
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

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtHinhthuc.Text = ""; //check 0-100
            txtChinhxac.Text = "";
            txtKhathi.Text = "";
            txtThuyetphuc.Text = "";
        }

        private void advancedDataGridView1_DoubleClick(object sender, EventArgs e)
        {
            if (adgv.CurrentRow.Index != -1)
            {
                txtID.Text = adgv.CurrentRow.Cells[0].Value.ToString();
            }
        }

        private void txtHinhthuc_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void txtChinhxac_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void txtKhathi_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void txtThuyetphuc_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }
    }
}
