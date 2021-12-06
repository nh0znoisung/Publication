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
    public partial class TGView : Form
    {
        private string V = ""; //ID of TG
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                    "Trusted_Connection=yes;" +
                    "database=Publication; " +
                           "connection timeout=30";
        const string SelectQuery = "select b.ID_BAIBAO, CONCAT(n.HO, ' ', n.TEN) as 'TENTACGIALIENLAC', b.TRANGTHAIXULI, b.TIEUDE, b.TOMTAT,b.TONGSOTRANG,b.NGAYNHAN from BAIBAO b, NHAKHOAHOC n where b.NHAKHOAHOC_ID = n.NHAKHOAHOC_ID";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();
        public TGView(String s)
        {
            InitializeComponent();
            V = s;
            
            using (SqlConnection con = new SqlConnection(myConn))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(SelectQuery + ";", con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(datatable);
                    }
                }
            }
            DataView view1 = new DataView(datatable);
            
            source1.DataSource = view1;

            adgv1.DataSource = source1;
        }

        private void advancedDataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // How to load the data in this account
            // How to insert in SANGTAC table
            // ID: 000001 Insert with it
        }

        private void TGView_Load(object sender, EventArgs e)
        {
        }

        private void searchToolBar1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void advancedDataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void advancedDataGridView1_FilterStringChanged(object sender, EventArgs e)
        {
            // binding source <-> data table <-> data view
            //DataView dv = new DataView(datatable);
            source1.Filter = adgv1.FilterString; // query example = "id = 10"
            //adgv1.DataSource = dv;

        }

        private void adgv1_SortStringChanged(object sender, EventArgs e)
        {
            source1.Sort = adgv1.SortString;
        }

        private void bAIBAOBindingSource_ListChanged(object sender, ListChangedEventArgs e)
        {
        }


        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {

        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            // Setup Dropdown
            if(comboBox.Text == "" && txtSearch.Text == "")
            {
                return;
            }
            if (comboBox.Text == "")
            {
                txtSearch.Text = "";
                MessageBox.Show("Please choose the columns for searching in the dropdown");
                return;
            }

            //label2.Text = comboBox.Text;
            //comboBox.Text =
            if (txtSearch.Text != "")
            {
                //adgv1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill; //Fit with the size of table
                //if have space in collumn name use []
                // Vietnamese have char  N''
                // textbox cannot write Vietnamese
                string command = SelectQuery + " AND " + comboBox.Text + " like '%" + txtSearch.Text + "%';";
                //label2.Text = command;
                // var datatable = new DataTable();
                using (SqlConnection con = new SqlConnection(myConn))
                {
                    con.Open();
                    using (SqlCommand com = new SqlCommand(command, con))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                        {
                            var datatable = new DataTable();
                            DataSet ds = new DataSet();
                            DataView dv = new DataView();
                            adapter.Fill(ds);
                            dv = new DataView(ds.Tables[0]);
                            adgv1.DataSource = dv;
                            con.Close();
                        }
                    }
                }
            }
            else if (txtSearch.Text == "")
            {
                adgv1.Refresh();
            }
        }
    }
}
