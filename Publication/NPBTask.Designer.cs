
namespace Publication
{
    partial class NPBTask
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
            this.label5 = new System.Windows.Forms.Label();
            this.btnClear = new System.Windows.Forms.Button();
            this.txtID = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.btnSave = new System.Windows.Forms.Button();
            this.adgv = new ADGV.AdvancedDataGridView();
            this.txtHinhthuc = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.txtChinhxac = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtKhathi = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtThuyetphuc = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).BeginInit();
            this.SuspendLayout();
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(373, 20);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(353, 38);
            this.label5.TabIndex = 42;
            this.label5.Text = "Chấm điểm phản biện";
            // 
            // btnClear
            // 
            this.btnClear.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(109)))), ((int)(((byte)(49)))));
            this.btnClear.Location = new System.Drawing.Point(233, 559);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(122, 49);
            this.btnClear.TabIndex = 83;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // txtID
            // 
            this.txtID.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtID.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtID.Location = new System.Drawing.Point(217, 106);
            this.txtID.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtID.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(200, 26);
            this.txtID.TabIndex = 80;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label13.Location = new System.Drawing.Point(69, 178);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(242, 29);
            this.label13.TabIndex = 76;
            this.label13.Text = "Chấm điểm: (1-100)";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label14.Location = new System.Drawing.Point(18, 107);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(189, 29);
            this.label14.TabIndex = 75;
            this.label14.Text = "ID Bài phản biện";
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.CornflowerBlue;
            this.btnSave.Location = new System.Drawing.Point(74, 559);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(122, 49);
            this.btnSave.TabIndex = 74;
            this.btnSave.Text = "Submit";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // adgv
            // 
            this.adgv.AllowUserToAddRows = false;
            this.adgv.AllowUserToDeleteRows = false;
            this.adgv.AllowUserToOrderColumns = true;
            this.adgv.AutoGenerateContextFilters = true;
            this.adgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.adgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.adgv.DateWithTime = false;
            this.adgv.Location = new System.Drawing.Point(448, 96);
            this.adgv.Name = "adgv";
            this.adgv.ReadOnly = true;
            this.adgv.RowHeadersWidth = 51;
            this.adgv.RowTemplate.Height = 24;
            this.adgv.Size = new System.Drawing.Size(635, 534);
            this.adgv.TabIndex = 84;
            this.adgv.TimeFilter = false;
            this.adgv.DoubleClick += new System.EventHandler(this.advancedDataGridView1_DoubleClick);
            // 
            // txtHinhthuc
            // 
            this.txtHinhthuc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtHinhthuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtHinhthuc.Location = new System.Drawing.Point(233, 255);
            this.txtHinhthuc.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtHinhthuc.MinimumSize = new System.Drawing.Size(20, 30);
            this.txtHinhthuc.Name = "txtHinhthuc";
            this.txtHinhthuc.Size = new System.Drawing.Size(98, 26);
            this.txtHinhthuc.TabIndex = 85;
            this.txtHinhthuc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtHinhthuc_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label1.Location = new System.Drawing.Point(84, 256);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 29);
            this.label1.TabIndex = 86;
            this.label1.Text = "Hình thức";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label2.Location = new System.Drawing.Point(39, 319);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(166, 29);
            this.label2.TabIndex = 87;
            this.label2.Text = "Tính chính xác";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label3.Location = new System.Drawing.Point(60, 386);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(136, 29);
            this.label3.TabIndex = 88;
            this.label3.Text = "Tính khả thi";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label4.Location = new System.Drawing.Point(17, 451);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(188, 29);
            this.label4.TabIndex = 89;
            this.label4.Text = "Tính thuyết phục";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label6.ForeColor = System.Drawing.Color.Red;
            this.label6.Location = new System.Drawing.Point(347, 256);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(59, 29);
            this.label6.TabIndex = 90;
            this.label6.Text = "/100";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label7.ForeColor = System.Drawing.Color.Red;
            this.label7.Location = new System.Drawing.Point(347, 320);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 29);
            this.label7.TabIndex = 92;
            this.label7.Text = "/100";
            // 
            // txtChinhxac
            // 
            this.txtChinhxac.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtChinhxac.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtChinhxac.Location = new System.Drawing.Point(233, 319);
            this.txtChinhxac.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtChinhxac.MinimumSize = new System.Drawing.Size(20, 30);
            this.txtChinhxac.Name = "txtChinhxac";
            this.txtChinhxac.Size = new System.Drawing.Size(98, 26);
            this.txtChinhxac.TabIndex = 91;
            this.txtChinhxac.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtChinhxac_KeyPress);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label8.ForeColor = System.Drawing.Color.Red;
            this.label8.Location = new System.Drawing.Point(347, 387);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(59, 29);
            this.label8.TabIndex = 94;
            this.label8.Text = "/100";
            // 
            // txtKhathi
            // 
            this.txtKhathi.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtKhathi.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtKhathi.Location = new System.Drawing.Point(233, 386);
            this.txtKhathi.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtKhathi.MinimumSize = new System.Drawing.Size(20, 30);
            this.txtKhathi.Name = "txtKhathi";
            this.txtKhathi.Size = new System.Drawing.Size(98, 26);
            this.txtKhathi.TabIndex = 93;
            this.txtKhathi.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtKhathi_KeyPress);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label9.ForeColor = System.Drawing.Color.Red;
            this.label9.Location = new System.Drawing.Point(347, 451);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(59, 29);
            this.label9.TabIndex = 96;
            this.label9.Text = "/100";
            // 
            // txtThuyetphuc
            // 
            this.txtThuyetphuc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtThuyetphuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtThuyetphuc.Location = new System.Drawing.Point(233, 450);
            this.txtThuyetphuc.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtThuyetphuc.MinimumSize = new System.Drawing.Size(20, 30);
            this.txtThuyetphuc.Name = "txtThuyetphuc";
            this.txtThuyetphuc.Size = new System.Drawing.Size(98, 26);
            this.txtThuyetphuc.TabIndex = 95;
            this.txtThuyetphuc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtThuyetphuc_KeyPress);
            // 
            // label10
            // 
            this.label10.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label10.Location = new System.Drawing.Point(12, 187);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(416, 341);
            this.label10.TabIndex = 0;
            // 
            // NPBTask
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1095, 647);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtThuyetphuc);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtKhathi);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtChinhxac);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtHinhthuc);
            this.Controls.Add(this.adgv);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.txtID);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label10);
            this.Name = "NPBTask";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "NPBTask";
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Button btnSave;
        private ADGV.AdvancedDataGridView adgv;
        private System.Windows.Forms.TextBox txtHinhthuc;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtChinhxac;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtKhathi;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtThuyetphuc;
        private System.Windows.Forms.Label label10;
    }
}