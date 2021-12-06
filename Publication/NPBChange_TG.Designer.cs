
namespace Publication
{
    partial class NPBChange_TG
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
            this.adgv = new ADGV.AdvancedDataGridView();
            this.btnClear = new System.Windows.Forms.Button();
            this.txtTomtat = new System.Windows.Forms.TextBox();
            this.txtFile = new System.Windows.Forms.TextBox();
            this.txtTieude = new System.Windows.Forms.TextBox();
            this.txtSotrang = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).BeginInit();
            this.SuspendLayout();
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
            this.adgv.Location = new System.Drawing.Point(19, 308);
            this.adgv.Name = "adgv";
            this.adgv.ReadOnly = true;
            this.adgv.RowHeadersWidth = 51;
            this.adgv.RowTemplate.Height = 24;
            this.adgv.Size = new System.Drawing.Size(1037, 472);
            this.adgv.TabIndex = 61;
            this.adgv.TimeFilter = false;
            this.adgv.SortStringChanged += new System.EventHandler(this.adgv_SortStringChanged);
            this.adgv.FilterStringChanged += new System.EventHandler(this.adgv_FilterStringChanged);
            this.adgv.DoubleClick += new System.EventHandler(this.adgv_DoubleClick);
            // 
            // btnClear
            // 
            this.btnClear.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(109)))), ((int)(((byte)(49)))));
            this.btnClear.Location = new System.Drawing.Point(679, 233);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(98, 38);
            this.btnClear.TabIndex = 60;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // txtTomtat
            // 
            this.txtTomtat.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTomtat.Location = new System.Drawing.Point(135, 142);
            this.txtTomtat.Margin = new System.Windows.Forms.Padding(4);
            this.txtTomtat.Multiline = true;
            this.txtTomtat.Name = "txtTomtat";
            this.txtTomtat.Size = new System.Drawing.Size(332, 129);
            this.txtTomtat.TabIndex = 59;
            // 
            // txtFile
            // 
            this.txtFile.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFile.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtFile.Location = new System.Drawing.Point(679, 139);
            this.txtFile.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtFile.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtFile.Name = "txtFile";
            this.txtFile.Size = new System.Drawing.Size(330, 26);
            this.txtFile.TabIndex = 58;
            // 
            // txtTieude
            // 
            this.txtTieude.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTieude.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtTieude.Location = new System.Drawing.Point(135, 87);
            this.txtTieude.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtTieude.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtTieude.Name = "txtTieude";
            this.txtTieude.Size = new System.Drawing.Size(332, 26);
            this.txtTieude.TabIndex = 57;
            // 
            // txtSotrang
            // 
            this.txtSotrang.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtSotrang.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtSotrang.Location = new System.Drawing.Point(679, 88);
            this.txtSotrang.MaximumSize = new System.Drawing.Size(400, 400);
            this.txtSotrang.MinimumSize = new System.Drawing.Size(200, 30);
            this.txtSotrang.Name = "txtSotrang";
            this.txtSotrang.Size = new System.Drawing.Size(330, 26);
            this.txtSotrang.TabIndex = 56;
            this.txtSotrang.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSotrang_KeyPress);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label6.Location = new System.Drawing.Point(549, 88);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(103, 29);
            this.label6.TabIndex = 55;
            this.label6.Text = "Số trang";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label12.Location = new System.Drawing.Point(512, 140);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(140, 29);
            this.label12.TabIndex = 54;
            this.label12.Text = "File bài báo";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label13.Location = new System.Drawing.Point(14, 145);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(94, 29);
            this.label13.TabIndex = 53;
            this.label13.Text = "Tóm tắt";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F);
            this.label14.Location = new System.Drawing.Point(12, 88);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(96, 29);
            this.label14.TabIndex = 52;
            this.label14.Text = "Tiêu đề";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(400, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(270, 38);
            this.label4.TabIndex = 51;
            this.label4.Text = "Lịch sử sáng tác";
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.Fuchsia;
            this.btnUpdate.Location = new System.Drawing.Point(931, 233);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(98, 38);
            this.btnUpdate.TabIndex = 50;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(203)))), ((int)(((byte)(24)))));
            this.btnDelete.Location = new System.Drawing.Point(807, 233);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(98, 38);
            this.btnDelete.TabIndex = 49;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = false;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(115)))), ((int)(((byte)(182)))), ((int)(((byte)(107)))));
            this.btnAdd.Location = new System.Drawing.Point(554, 233);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(98, 38);
            this.btnAdd.TabIndex = 48;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // NPBChange_TG
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1078, 792);
            this.Controls.Add(this.adgv);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.txtTomtat);
            this.Controls.Add(this.txtFile);
            this.Controls.Add(this.txtTieude);
            this.Controls.Add(this.txtSotrang);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnAdd);
            this.Name = "NPBChange_TG";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "NPBChange_TG";
            ((System.ComponentModel.ISupportInitialize)(this.adgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ADGV.AdvancedDataGridView adgv;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.TextBox txtTomtat;
        private System.Windows.Forms.TextBox txtFile;
        private System.Windows.Forms.TextBox txtTieude;
        private System.Windows.Forms.TextBox txtSotrang;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnAdd;
    }
}