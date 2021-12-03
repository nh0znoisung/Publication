
namespace Publication
{
    partial class Login
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.btn_Login = new System.Windows.Forms.Button();
            this.txt_UserName = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_Password = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label1.Location = new System.Drawing.Point(90, 74);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(124, 29);
            this.label1.TabIndex = 0;
            this.label1.Text = "Username";
            // 
            // btn_Login
            // 
            this.btn_Login.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_Login.Location = new System.Drawing.Point(227, 241);
            this.btn_Login.Name = "btn_Login";
            this.btn_Login.Size = new System.Drawing.Size(121, 41);
            this.btn_Login.TabIndex = 2;
            this.btn_Login.Text = "Log In";
            this.btn_Login.UseVisualStyleBackColor = true;
            this.btn_Login.Click += new System.EventHandler(this.button1_Click);
            // 
            // txt_UserName
            // 
            this.txt_UserName.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_UserName.Location = new System.Drawing.Point(227, 78);
            this.txt_UserName.MaximumSize = new System.Drawing.Size(400, 400);
            this.txt_UserName.MinimumSize = new System.Drawing.Size(200, 35);
            this.txt_UserName.Name = "txt_UserName";
            this.txt_UserName.Size = new System.Drawing.Size(271, 26);
            this.txt_UserName.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label3.Location = new System.Drawing.Point(90, 160);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(120, 29);
            this.label3.TabIndex = 4;
            this.label3.Text = "Password";
            // 
            // txt_Password
            // 
            this.txt_Password.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txt_Password.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_Password.Location = new System.Drawing.Point(227, 164);
            this.txt_Password.MaximumSize = new System.Drawing.Size(400, 400);
            this.txt_Password.MinimumSize = new System.Drawing.Size(200, 35);
            this.txt_Password.Name = "txt_Password";
            this.txt_Password.Size = new System.Drawing.Size(271, 26);
            this.txt_Password.TabIndex = 5;
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(580, 330);
            this.Controls.Add(this.txt_Password);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txt_UserName);
            this.Controls.Add(this.btn_Login);
            this.Controls.Add(this.label1);
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_Login;
        private System.Windows.Forms.TextBox txt_UserName;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_Password;
    }
}