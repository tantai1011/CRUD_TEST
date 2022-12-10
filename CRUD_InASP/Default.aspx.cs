using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_InASP
{
    public partial class _Default : Page
    {
        SqlConnection connection = new SqlConnection("Data Source=10.4.3.230;Initial Catalog=CRUD_testDB;Persist Security Info=True;User ID=sa;Password=shc@1234");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployeeList();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = int.Parse(txtID.Text);
                string empName = txtName.Text, city = dropdownCity.SelectedValue, sex = radioBtnGender.SelectedValue, contact = txtContact.Text;
                double age = double.Parse(txtAge.Text);
                DateTime jdate = DateTime.Parse(txtJoiningDate.Text).Date;

                SqlCommand command = new SqlCommand("Insert into EmployeeSetup_table values ('" + empID + "','" + empName + "','" + city + "','" + age + "','" + sex + "','" + jdate + "','" + contact + "')", connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);
                GetEmployeeList();
            }
            catch (Exception ex) { }
        }

        void GetEmployeeList()
        {
            SqlCommand command = new SqlCommand("Select * from EmployeeSetup_table", connection);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = int.Parse(txtID.Text);
                string empName = txtName.Text, city = dropdownCity.SelectedValue, sex = radioBtnGender.SelectedValue, contact = txtContact.Text;
                double age = double.Parse(txtAge.Text);
                DateTime jdate = DateTime.Parse(txtJoiningDate.Text);

                SqlCommand command = new SqlCommand("Update EmployeeSetup_table set EmpName = '" + empName + "', City = '" + city + "', Age = '" + age + "',Sex = '" + sex + "', JoiningDate = '" + jdate + "', Contact = '" + contact + "' where EmpID = '" + empID + "'", connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully updated');", true);
                GetEmployeeList();
            }
            catch (Exception ex) { }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = int.Parse(txtID.Text);

                SqlCommand command = new SqlCommand("Delete EmployeeSetup_table where EmpID = '" + empID + "'", connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted');", true);
                GetEmployeeList();
            }
            catch (Exception ex) { }
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = int.Parse(txtID.Text);

                SqlCommand command = new SqlCommand("Select * from EmployeeSetup_table where EmpID = '" + empID + "'", connection);
                SqlDataAdapter sd = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex) { }
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            GetEmployeeList();
        }
    }
}