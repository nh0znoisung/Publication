using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Publication
{
    public partial class NPBView : Form
    {
        private string V = ""; //ID of TG
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                    "Trusted_Connection=yes;" +
                    "database=Publication; " +
                           "connection timeout=30";
        const string SelectQuery = "select b.BAIPHANBIEN_ID,b.ID_BAIBAO,t.NHAKHOAHOC_ID,CONCAT(n.HO, ' ', n.TEN) as TENNGUOIPHANBIEN from BAIPHANBIEN b JOIN THUCHIENPHANBIEN t ON b.ID_BAIBAO = t.ID_BAIBAO AND b.BAIPHANBIEN_ID = t.BAIPHANBIEN_ID JOIN NHAKHOAHOC n ON t.NHAKHOAHOC_ID = n.NHAKHOAHOC_ID";
        DataTable datatable = new DataTable();
        BindingSource source1 = new BindingSource();
        public NPBView(String s)
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
            // Add more collumns to datatable
            datatable.Columns.Add("HINHTHUC", typeof(Int32)); // Int32 Or String
            datatable.Columns.Add("TINHCHINHXAC", typeof(Int32));
            datatable.Columns.Add("TINHKHATHI", typeof(Int32));
            datatable.Columns.Add("TINHTHUYETPHUC", typeof(Int32));
            datatable.Columns.Add("DIEMTRUNGBINH", typeof(Int32));
            List<string> mota = new List<string>(new string[] { "HINHTHUC", "TINHCHINHXAC", "TINHKHATHI", "TINHTHUYETPHUC" });
            
            for (int i = 0; i<datatable.Rows.Count; i++)
            {
                //row[i][0].ToString()->BPB_ID
                //row[1].ToString()->BB_ID
                //row[2].ToString()->NKH_ID
                //mota
                // Use fake Datatable to THUCHIENPHANBIEN_TIEUCHIPHANBIEN
                int tmp = 0;
                for (int j =0; j<4; j++)
                {
                    DataTable dt = new DataTable();
                    String Query = "select * from THUCHIENPHANBIEN_TIEUCHIPHANBIEN where MOTA='" + mota[j] + "' AND BAIPHANBIEN_ID='" + datatable.Rows[i][0].ToString() + "' AND ID_BAIBAO='" + datatable.Rows[i][1].ToString() + "' AND NHAKHOAHOC_ID='" + datatable.Rows[i][2].ToString() + "'";
                    using (SqlConnection con = new SqlConnection(myConn))
                    {
                        con.Open();

                        using (SqlCommand com = new SqlCommand(Query + ";", con))
                        {
                            using (SqlDataAdapter adapter = new SqlDataAdapter(com))
                            {
                                adapter.Fill(dt);
                                con.Close();
                            }
                        }
                    }
                    if(dt.Rows.Count > 0) 
                    {
                        datatable.Rows[i][4 + j] = dt.Rows[0][1].ToString();
                        tmp += Convert.ToInt32(dt.Rows[0][1]);
                    }
                    else
                    {
                        datatable.Rows[i][4 + j] = "0";
                    }
                }
                datatable.Rows[i][8] = Convert.ToInt32(tmp / 4);
            }

            // Convert.Int32(String)
            DataView view1 = new DataView(datatable);
            source1.DataSource = view1;
            adgv1.DataSource = source1;
        }

        private void adgv1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void adgv1_SortStringChanged(object sender, EventArgs e)
        {
            source1.Sort = adgv1.SortString;
        }

        private void adgv1_FilterStringChanged(object sender, EventArgs e)
        {
            source1.Filter = adgv1.FilterString;
        }
    }
}
