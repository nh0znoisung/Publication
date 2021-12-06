
namespace Publication
{
    partial class BBTTask
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
            this.label2 = new System.Windows.Forms.Label();
            this.adgv = new ADGV.AdvancedDataGridView();
            this.btnClear = new System.Windows.Forms.Button();
            this.txtNPB = new System.Windows.Forms.TextBox();
            this.txtNgay = new System.Windows.Forms.TextBox();
            this.txtID = new System.Windows.Forms.TextBox();
            this.txtDiadiem = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.btnAdd = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).BeginInit();
            this.SuspendLayout();
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(370, 9);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(343, 38);
            this.label5.TabIndex = 41;
            this.label5.Text = "Phân công phản biện";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label2.ForeColor = System.Drawing.Color.Red;
            this.label2.Location = new System.Drawing.Point(605, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(323, 29);
            this.label2.TabIndex = 58;
            this.label2.Text = "Bài phản biện chờ phân công";
            // 
            // adgv
            // 
            this.adgv.AllowUserToAddRows = false;
            this.adgv.AllowUserToDeleteRows = false;
            this.adgv.AllowUserToOrderColumns = true;
            this.adgv.AutoGenerateContextFilters = true;
            this.adgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.adgv.DateWithTime = false;
            this.adgv.Location = new System.Drawing.Point(442, 108);
            this.adgv.Name = "adgv";
            this.adgv.ReadOnly = true;
            this.adgv.RowHeadersWidth = 51;
            this.adgv.RowTemplate.Height = 24;
            this.adgv.Size = new System.Drawing.Size(633, 467);
            this.adgv.TabIndex = 59;
            this.adgv.TimeFilter = false;
            this.adgv.DoubleClick += new System.EventHandler(this.adgv1_DoubleClick);
            // 
            // btnClear
            // 
            this.btnClear.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(109)))), ((int)(((byte)(49)))));
            this.btnClear.Location = new System.Drawing.Point(239, 516);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(109, 52);
            this.btnClear.TabIndex = 71;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // txtNPB
            // 
            this.txtNPB.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNPB.Location = new System.Drawing.Point(217, 254);
            this.txtNPB.Margin = new System.Windows.Forms.Padding(4);
            this.txtNPB.Multiline = true;
            this.txtNPB.Name = "txtNPB";
            this.txtNPB.Size = new System.Drawing.Size(200, 91);
            this.txtNPB.TabIndex = 70;
            // 
            // txtNgay
            // 
            this.txtNgay.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtNgay.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtNgay.Location = new System.Drawing.Point(217, 424);
            this.txtNgay.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtNgay.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtNgay.Name = "txtNgay";
            this.txtNgay.Size = new System.Drawing.Size(200, 26);
            this.txtNgay.TabIndex = 69;
            // 
            // txtID
            // 
            this.txtID.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtID.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtID.Location = new System.Drawing.Point(217, 131);
            this.txtID.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtID.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(200, 26);
            this.txtID.TabIndex = 68;
            // 
            // txtDiadiem
            // 
            this.txtDiadiem.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtDiadiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtDiadiem.Location = new System.Drawing.Point(217, 368);
            this.txtDiadiem.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtDiadiem.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtDiadiem.Name = "txtDiadiem";
            this.txtDiadiem.Size = new System.Drawing.Size(200, 26);
            this.txtDiadiem.TabIndex = 67;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label6.Location = new System.Drawing.Point(90, 369);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(109, 29);
            this.label6.TabIndex = 66;
            this.label6.Text = "Địa điểm";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label12.Location = new System.Drawing.Point(18, 420);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(181, 29);
            this.label12.TabIndex = 65;
            this.label12.Text = "Ngày phản biện";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label13.Location = new System.Drawing.Point(20, 264);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(190, 29);
            this.label13.TabIndex = 64;
            this.label13.Text = "Người phản biện";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label14.Location = new System.Drawing.Point(9, 131);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(189, 29);
            this.label14.TabIndex = 63;
            this.label14.Text = "ID Bài phản biện";
            // 
            // btnAdd
            // 
            this.btnAdd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(115)))), ((int)(((byte)(182)))), ((int)(((byte)(107)))));
            this.btnAdd.Location = new System.Drawing.Point(89, 516);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(109, 52);
            this.btnAdd.TabIndex = 60;
            this.btnAdd.Text = "Submit";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label1.Location = new System.Drawing.Point(49, 207);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(258, 29);
            this.label1.TabIndex = 78;
            this.label1.Text = "Phân công phản biện";
            // 
            // label10
            // 
            this.label10.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label10.Location = new System.Drawing.Point(14, 225);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(417, 263);
            this.label10.TabIndex = 77;
            // 
            // BBTTask
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1087, 596);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.txtNPB);
            this.Controls.Add(this.txtNgay);
            this.Controls.Add(this.txtID);
            this.Controls.Add(this.txtDiadiem);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.adgv);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label10);
            this.Name = "BBTTask";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "BBTTask";
            this.Load += new System.EventHandler(this.BBTTask_Load);
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label2;
        private ADGV.AdvancedDataGridView adgv;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.TextBox txtNPB;
        private System.Windows.Forms.TextBox txtNgay;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.TextBox txtDiadiem;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label10;
    }
}