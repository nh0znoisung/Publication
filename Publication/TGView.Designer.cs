
namespace Publication
{
    partial class TGView
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
            this.adgv1 = new ADGV.AdvancedDataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.comboBox = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.adgv1)).BeginInit();
            this.SuspendLayout();
            // 
            // adgv1
            // 
            this.adgv1.AllowUserToAddRows = false;
            this.adgv1.AllowUserToDeleteRows = false;
            this.adgv1.AllowUserToOrderColumns = true;
            this.adgv1.AutoGenerateContextFilters = true;
            this.adgv1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.adgv1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.adgv1.DateWithTime = false;
            this.adgv1.Location = new System.Drawing.Point(12, 48);
            this.adgv1.Name = "adgv1";
            this.adgv1.ReadOnly = true;
            this.adgv1.RowHeadersWidth = 51;
            this.adgv1.RowTemplate.Height = 24;
            this.adgv1.Size = new System.Drawing.Size(1106, 539);
            this.adgv1.TabIndex = 0;
            this.adgv1.TimeFilter = false;
            this.adgv1.SortStringChanged += new System.EventHandler(this.adgv1_SortStringChanged);
            this.adgv1.FilterStringChanged += new System.EventHandler(this.advancedDataGridView1_FilterStringChanged);
            this.adgv1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.advancedDataGridView1_CellContentClick_1);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(44, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(81, 25);
            this.label1.TabIndex = 3;
            this.label1.Text = "Search:";
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(131, 9);
            this.txtSearch.MaximumSize = new System.Drawing.Size(900, 50);
            this.txtSearch.MinimumSize = new System.Drawing.Size(700, 30);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(746, 22);
            this.txtSearch.TabIndex = 4;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChanged);
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // comboBox
            // 
            this.comboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox.FormattingEnabled = true;
            this.comboBox.Items.AddRange(new object[] {
            "ID_BAIBAO",
            "TRANGTHAIXULI",
            "TIEUDE",
            "TOMTAT",
            "TONGSOTRANG",
            "NGAYNHAN"});
            this.comboBox.Location = new System.Drawing.Point(899, 9);
            this.comboBox.MaximumSize = new System.Drawing.Size(1000, 0);
            this.comboBox.MinimumSize = new System.Drawing.Size(130, 0);
            this.comboBox.Name = "comboBox";
            this.comboBox.Size = new System.Drawing.Size(165, 24);
            this.comboBox.TabIndex = 5;
            // 
            // TGView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.ClientSize = new System.Drawing.Size(1130, 616);
            this.Controls.Add(this.comboBox);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.adgv1);
            this.Name = "TGView";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "TGView";
            this.Load += new System.EventHandler(this.TGView_Load);
            ((System.ComponentModel.ISupportInitialize)(this.adgv1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private ADGV.AdvancedDataGridView adgv1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.ComboBox comboBox;
    }
}