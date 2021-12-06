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
    public partial class NPBMain : Form
    {
        private string V = ""; //200002
        const string myConn = "server=DESKTOP-NASB1TK\\SQLEXPRESS;" +
                        "Trusted_Connection=yes;" +
                        "database=Publication; " +
                               "connection timeout=30";
        public NPBMain(String s)
        {
            InitializeComponent();
            V = s;
            DataTable dt = new DataTable();
            string SelectNhakhoahocQuery = "select * from nhakhoahoc where NHAKHOAHOC_ID = '" + s + "'";
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
            label2.Text = "Trang chủ của Nhà Phản Biện " + s;
            label3.Text = "Xin chào, " + dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString() + ".  Hãy chọn tác vụ mà bạn cần!!!";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NPBView fm = new NPBView(V);
            fm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            NPBChange fm = new NPBChange(V);
            fm.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            TGView fm = new TGView(V);
            fm.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            NPBChange_TG fm = new NPBChange_TG(V);
            fm.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
            Login fm = new Login();
            fm.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            // Task
            NPBTask fm = new NPBTask(V);
            fm.Show();
        }
    }
}
