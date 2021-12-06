using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Publication
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
            txt_Password.PasswordChar = '*';
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txt_UserName.Text == "" && txt_Password.Text == "")
            {
                MessageBox.Show("Please provide UserName and Password");
                return;
            }
            else if (txt_UserName.Text == "")
            {
                MessageBox.Show("Please provide UserName");
                return;
            }
            else if (txt_Password.Text == "")
            {
                MessageBox.Show("Please provide Password");
                return;
            }
            else
            {
                // already fill the textbox
                if (txt_UserName.Text == "TG0" && txt_Password.Text == "0")
                {
                    // Login sucessful in TG View
                   // MessageBox.Show("Login Successful!");
                    this.Hide();
                    //Settings.Id = "300001";
                    TGMain fm = new TGMain("300001");
                    fm.Show();
                }
                else if (txt_UserName.Text == "NPB0" && txt_Password.Text == "0")
                {
                    // Login sucessful in NPB View
                    this.Hide();
                    NPBMain fm = new NPBMain("200002");
                    fm.Show();
                }
                else if (txt_UserName.Text == "BBT0" && txt_Password.Text == "0")
                {
                    // Login sucessful in BBT View
                    this.Hide();
                    //this.Close();
                    BBTMain fm = new BBTMain("100001");
                    fm.Show();
                }
                else
                {
                    MessageBox.Show("Login Failed!");
                    // return;
                }
                
            }
        }
    }
}
