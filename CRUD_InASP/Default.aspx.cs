using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_InASP
{
    public partial class _Default : Page
    {
        string constr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection connection;
        SqlCommand command;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployeeList();
            }
        }

        void GetEmployeeList()
        {
            using (connection = new SqlConnection(constr))
            {
                command = new SqlCommand("Select * from EmployeeSetup_table", connection);
                SqlDataAdapter sd = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                gvData.DataSource = dt;
                gvData.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ArrayList userdetails = (ArrayList)ViewState["CHECKED_ITEMS"];
            for (int i = 0; i < userdetails.Count; i++)
            {
                using (connection = new SqlConnection(constr))
                {
                    command = new SqlCommand("Delete EmployeeSetup_table where EmpID = @empID", connection);
                    command.Parameters.AddWithValue("@empID", userdetails[i]);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            GetEmployeeList();
        }

        protected void gvData0_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvData.EditIndex = e.NewEditIndex;
            GetEmployeeList();
        }

        protected void gvData0_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvData.EditIndex = -1;
            GetEmployeeList();
        }

        protected void gvData0_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblUpdateID = gvData.Rows[e.RowIndex].FindControl("lblUpdateID") as Label;
            //TextBox txtID = gvData0.Rows[e.RowIndex].FindControl("txtID") as TextBox;
            TextBox txtName = gvData.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            DropDownList ddlCity = gvData.Rows[e.RowIndex].FindControl("ddlCity") as DropDownList;
            TextBox txtAge = gvData.Rows[e.RowIndex].FindControl("txtAge") as TextBox;
            RadioButtonList rbtSex = gvData.Rows[e.RowIndex].FindControl("rbtSex") as RadioButtonList;
            TextBox txtJoiningDate = gvData.Rows[e.RowIndex].FindControl("txtJoiningDate") as TextBox;
            TextBox txtContact = gvData.Rows[e.RowIndex].FindControl("txtContact") as TextBox;

            int empID = int.Parse(lblUpdateID.Text);
            string empName = txtName.Text, city = ddlCity.SelectedValue, sex = rbtSex.SelectedValue, contact = txtContact.Text;
            double age = double.Parse(txtAge.Text);
            DateTime jdate = DateTime.Parse(txtJoiningDate.Text);

            using (connection = new SqlConnection(constr))
            {
                command = new SqlCommand("Update EmployeeSetup_table set EmpName = @empName, City = @city, Age = @age, Sex = @sex, JoiningDate = @jdate, Contact = @contact where EmpID = @empID", connection);
                command.Parameters.AddWithValue("@empID", empID);
                command.Parameters.AddWithValue("@empName", empName);
                command.Parameters.AddWithValue("@city", city);
                command.Parameters.AddWithValue("@age", age);
                command.Parameters.AddWithValue("@sex", sex);
                command.Parameters.AddWithValue("@jdate", jdate);
                command.Parameters.AddWithValue("@contact", contact);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            gvData.EditIndex = -1;
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully updated');", true);
            GetEmployeeList();
        }

        protected void gvData0_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int empID = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value);

            using (connection = new SqlConnection(constr))
            {
                command = new SqlCommand("Delete EmployeeSetup_table where EmpID = @empID", connection);
                command.Parameters.AddWithValue("@empID", empID);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted');", true);
            GetEmployeeList();
        }

        protected void gvData0_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SaveCheckedValues();
            gvData.PageIndex = e.NewPageIndex;
            GetEmployeeList();
            PopulateCheckedValues();
        }

        private void PopulateCheckedValues()
        {
            ArrayList userdetails = (ArrayList)ViewState["CHECKED_ITEMS"];
            if (userdetails != null && userdetails.Count > 0)
            {
                foreach (GridViewRow gvrow in gvData.Rows)
                {
                    int index = (int)gvData.DataKeys[gvrow.RowIndex].Value;
                    if (userdetails.Contains(index))
                    {
                        CheckBox ckb = (CheckBox)gvrow.FindControl("ckbDelete");
                        ckb.Checked = true;
                    }
                }
            }
        }

        private void SaveCheckedValues()
        {
            ArrayList userdetails = new ArrayList();
            int index = -1;
            foreach (GridViewRow gvrow in gvData.Rows)
            {
                index = (int)gvData.DataKeys[gvrow.RowIndex].Value;
                bool result = ((CheckBox)gvrow.FindControl("ckbDelete")).Checked;

                // Check in the Session
                if (ViewState["CHECKED_ITEMS"] != null)
                {
                    userdetails = (ArrayList)ViewState["CHECKED_ITEMS"];
                }

                if (result)
                {
                    if (!userdetails.Contains(index))
                    {
                        userdetails.Add(index);
                    }
                }
                else
                {
                    userdetails.Remove(index);
                }
            }

            if (userdetails != null && userdetails.Count > 0)
            {
                ViewState["CHECKED_ITEMS"] = userdetails;
            }
        }

        protected void gvData0_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            TextBox txtInsertID = gvData.FooterRow.FindControl("txtInsertID") as TextBox;
            TextBox txtInsertName = gvData.FooterRow.FindControl("txtInsertName") as TextBox;
            DropDownList ddlInsertCity = gvData.FooterRow.FindControl("ddlInsertCity") as DropDownList;
            TextBox txtInsertAge = gvData.FooterRow.FindControl("txtInsertAge") as TextBox;
            RadioButtonList rbtInsertSex = gvData.FooterRow.FindControl("rbtInsertSex") as RadioButtonList;
            TextBox txtInsertJoiningDate = gvData.FooterRow.FindControl("txtInsertJoiningDate") as TextBox;
            TextBox txtInsertContact = gvData.FooterRow.FindControl("txtInsertContact") as TextBox;
            try
            {
                int empID = int.Parse(txtInsertID.Text);
                string empName = txtInsertName.Text, city = ddlInsertCity.SelectedValue, sex = rbtInsertSex.SelectedValue, contact = txtInsertContact.Text;
                double age = double.Parse(txtInsertAge.Text);
                DateTime jdate = DateTime.Parse(txtInsertJoiningDate.Text);

                int recordsInserted = 0;

                using (connection = new SqlConnection(constr))
                {
                    string query = "IF NOT EXISTS(SELECT EmpID FROM EmployeeSetup_table WHERE EmpID = @empID) ";
                    query += "BEGIN ";
                    query += "Insert into EmployeeSetup_table(EmpID, EmpName, City, Age, Sex, JoiningDate, Contact) values (@empID, @empName, @city, @age, @sex, @jdate, @contact) ";
                    query += "END";
                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@empID", empID);
                    command.Parameters.AddWithValue("@empName", empName);
                    command.Parameters.AddWithValue("@city", city);
                    command.Parameters.AddWithValue("@age", age);
                    command.Parameters.AddWithValue("@sex", sex);
                    command.Parameters.AddWithValue("@jdate", jdate);
                    command.Parameters.AddWithValue("@contact", contact);
                    connection.Open();
                    recordsInserted = command.ExecuteNonQuery();
                    connection.Close();
                }
                gvData.EditIndex = -1;
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);
                GetEmployeeList();
                if (recordsInserted == -1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Duplicate record. Please insert Unique ID.');", true);
                }
            }
            catch (Exception ex) { }

        }

        protected void ckbDelete_CheckedChanged(object sender, EventArgs e)
        {
            SaveCheckedValues();
        }

    }
}