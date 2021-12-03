
namespace Publication
{
    partial class NPBView
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
            this.label5 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.adgv1)).BeginInit();
            this.SuspendLayout();
            // 
            // adgv1
            // 
            this.adgv1.AllowUserToAddRows = false;
            this.adgv1.AllowUserToDeleteRows = false;
            this.adgv1.AllowUserToOrderColumns = true;
            this.adgv1.AutoGenerateContextFilters = true;
            this.adgv1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.adgv1.DateWithTime = false;
            this.adgv1.Location = new System.Drawing.Point(12, 95);
            this.adgv1.Name = "adgv1";
            this.adgv1.ReadOnly = true;
            this.adgv1.RowHeadersWidth = 51;
            this.adgv1.RowTemplate.Height = 24;
            this.adgv1.Size = new System.Drawing.Size(1106, 505);
            this.adgv1.TabIndex = 6;
            this.adgv1.TimeFilter = false;
            this.adgv1.SortStringChanged += new System.EventHandler(this.adgv1_SortStringChanged);
            this.adgv1.FilterStringChanged += new System.EventHandler(this.adgv1_FilterStringChanged);
            this.adgv1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.adgv1_CellContentClick);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(414, 9);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(306, 38);
            this.label5.TabIndex = 43;
            this.label5.Text = "Lịch sử chấm điểm";
            // 
            // NPBView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1125, 612);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.adgv1);
            this.Name = "NPBView";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "NPBView";
            ((System.ComponentModel.ISupportInitialize)(this.adgv1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private ADGV.AdvancedDataGridView adgv1;
        private System.Windows.Forms.Label label5;
    }
}