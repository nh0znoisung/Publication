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
    public partial class BBTView : Form
    {
        private string V = ""; //ID of TG
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                    "Trusted_Connection=yes;" +
                    "database=Publication; " +
                           "connection timeout=30";
        const string SelectQuery = "select p.BAIPHANBIEN_ID, p.ID_BAIBAO, t.NHAKHOAHOC_ID ,CONCAT(n.HO, ' ', n.TEN) as TENNGUOIPHANBIEN, p.DIADIEMPHANBIEN, p.NGAYPHANBIEN from THUCHIENPHANBIEN t join PHANCONGPHANBIEN p on t.BAIPHANBIEN_ID = p.BAIPHANBIEN_ID and t.ID_BAIBAO = p.ID_BAIBAO join NHAKHOAHOC n on n.NHAKHOAHOC_ID = t.NHAKHOAHOC_ID";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();
        public BBTView(String s)
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
                        con.Close();
                    }
                }
            }
            DataView view1 = new DataView(datatable);
            source1.DataSource = view1;
            adgv1.DataSource = source1;
        }

        private void adgv1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void adgv1_FilterStringChanged(object sender, EventArgs e)
        {
            source1.Filter = adgv1.FilterString;
        }

        private void adgv1_SortStringChanged(object sender, EventArgs e)
        {
            source1.Sort = adgv1.SortString;
        }

        //private void txtSearch_TextChanged(object sender, EventArgs e)
        //{
        //    // Setup Dropdown
        //    if (comboBox.Text == "" && txtSearch.Text == "")
        //    {
        //        return;
        //    }
        //    if (comboBox.Text == "")
        //    {
        //        txtSearch.Text = "";
        //        MessageBox.Show("Please choose the columns for searching in the dropdown");
        //        return;
        //    }

        //    //label2.Text = comboBox.Text;
        //    //comboBox.Text =
        //    if (txtSearch.Text != "")
        //    {
        //        //adgv1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill; //Fit with the size of table
        //        //if have space in collumn name use []
        //        // Vietnamese have char  N''
        //        // textbox cannot write Vietnamese
        //        string command = SelectQuery + " AND " + comboBox.Text + " like '%" + txtSearch.Text + "%';";
        //        //label2.Text = command;
        //        // var datatable = new DataTable();
        //        using (SqlConnection con = new SqlConnection(myConn))
        //        {
        //            con.Open();
        //            using (SqlCommand com = new SqlCommand(command, con))
        //            {
        //                using (SqlDataAdapter adapter = new SqlDataAdapter(com))
        //                {
        //                    var datatable = new DataTable();
        //                    DataSet ds = new DataSet();
        //                    DataView dv = new DataView();
        //                    adapter.Fill(ds);
        //                    dv = new DataView(ds.Tables[0]);
        //                    adgv1.DataSource = dv;
        //                    con.Close();
        //                }
        //            }
        //        }
        //    }
        //    else if (txtSearch.Text == "")
        //    {
        //        adgv1.Refresh();
        //    }
        //}
    }
}
