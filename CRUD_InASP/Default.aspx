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
                        <td style="height: 20px"></td>
                        <td style="height: 20px"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Employee ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtID" runat="server" Font-Size="Medium" Width="200px" TextMode="Number"></asp:TextBox>
                            <asp:Button ID="btnGet" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnGet_Click" Text="GET" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Employee Name"></asp:Label>
                        </td>
                        <td style="height: 24px">
                            <asp:TextBox ID="txtName" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Employee City"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="dropdownCity" runat="server" Font-Size="Medium" Width="200px" Height="30px">
                                <asp:ListItem>Chicago</asp:ListItem>
                                <asp:ListItem>New York</asp:ListItem>
                                <asp:ListItem>Los Angeles</asp:ListItem>
                                <asp:ListItem>Seattle</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Employee Age"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAge" runat="server" Font-Size="Medium" Width="200px" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 22px">
                            <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text="Employee Sex"></asp:Label>
                        </td>
                        <td style="height: 22px">
                            <asp:RadioButtonList ID="radioBtnGender" runat="server" RepeatDirection="Horizontal" Height="30px" Width="200px">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 22px">
                            <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text="Joining Date"></asp:Label>
                        </td>
                        <td style="height: 22px">
                            <asp:TextBox ID="txtJoiningDate" runat="server" Font-Size="Medium" Width="200px" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                            <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text="Contact"></asp:Label>
                        </td>
                        <td style="height: 20px">
                            <asp:TextBox ID="txtContact" runat="server" Font-Size="Medium" Width="200px" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnInsert" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnInsert_Click" Text="Insert" Width="100px" />
                            <asp:Button ID="btnUpdate" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnUpdate_Click" Text="Update" Width="100px" />
                            <asp:Button ID="btnDelete" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure to delete?');" Text="Delete" Width="100px" />
                            <asp:Button ID="btnLoad" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" OnClick="btnLoad_Click" Text="Load" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" Width="800px">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>


