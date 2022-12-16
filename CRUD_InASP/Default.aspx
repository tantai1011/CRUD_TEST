<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_InASP._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 15px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="nav-justified">
                    <tr>
                        <td colspan="2" style="font-size: x-large; font-weight: bold; color: #333333">Demo CRUD in ASP.Net With SQL</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure to delete?');" Text="Delete" Width="100px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 20px">&nbsp;</td>
                        <td style="height: 20px"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvData" runat="server" Width="800px" AutoGenerateColumns="False" ShowFooter="True" Style="margin-top: 0px; text-align: center; padding: 5px" OnRowCancelingEdit="gvData0_RowCancelingEdit" OnRowEditing="gvData0_RowEditing" OnRowUpdating="gvData0_RowUpdating" OnRowDeleting="gvData0_RowDeleting" DataKeyNames="EmpID" AllowPaging="True" OnPageIndexChanging="gvData0_PageIndexChanging" PageSize="5" OnRowCommand="gvData0_RowCommand" CellSpacing="2" CssClass="Gridview">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ckbDelete" runat="server" OnCheckedChanged="ckbDelete_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ID">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="txtID" runat="server" Text='<%# Bind("EmpID") %>'></asp:TextBox>--%>
                                            <asp:Label ID="lblUpdateID" runat="server" Text='<%# Bind("EmpID") %>' Width="100px"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtInsertID" runat="server" Width="100px"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("EmpName") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("EmpName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtInsertName" runat="server" Width="100px"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="City">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlCity" runat="server" Text='<%# Bind("City") %>' Font-Size="Medium" Width="100px" Height="30px">
                                                <asp:ListItem>Chicago</asp:ListItem>
                                                <asp:ListItem>New York</asp:ListItem>
                                                <asp:ListItem>Los Angeles</asp:ListItem>
                                                <asp:ListItem>Seattle</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlInsertCity" runat="server" Font-Size="Medium" Width="100px" Height="30px">
                                                <asp:ListItem>Chicago</asp:ListItem>
                                                <asp:ListItem>New York</asp:ListItem>
                                                <asp:ListItem>Los Angeles</asp:ListItem>
                                                <asp:ListItem>Seattle</asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Age">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtInsertAge" runat="server" Width="100px"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sex">
                                        <EditItemTemplate>
                                            <asp:RadioButtonList ID="rbtSex" runat="server" Text='<%# Bind("Sex") %>' RepeatDirection="Horizontal" Height="30px" Width="200px">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Other</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSex" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:RadioButtonList ID="rbtInsertSex" runat="server" Text='<%# Bind("Sex") %>' RepeatDirection="Horizontal" Height="30px" Width="200px">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Other</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Joining Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtJoiningDate" runat="server" Text='<%# Bind("JoiningDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblJoiningDate" runat="server" Text='<%# Bind("JoiningDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtInsertJoiningDate" runat="server" TextMode="Date"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("Contact") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblContact" runat="server" Text='<%# Bind("Contact") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtInsertContact" runat="server" Width="100px"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Controls">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                                            <asp:Button ID="btnDelete0" Text="Delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete?');" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btnUpdate" Text="Update" runat="server" CommandName="Update" />
                                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btnInsert" Text="Insert" runat="server" CommandName="AddNew" />
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                </Columns>
                                <PagerStyle Font-Size="Medium" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>


