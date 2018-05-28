<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body{ width:100%; margin:0px; padding:0px;}
        .container{ width:84%; margin-left:7%; margin-right:7%; margin-top:0px; padding:10px; border:1px solid #333;}
        .title{ font-size:50px; font-weight:bold; text-align:center; font-family:微软雅黑;}
        .welcome{ font-size:40px; text-align:left; font-weight:bolder; float:left; color:#46ff06;}
        .in_left{ 
            width:70%; float:left; line-height:40px; font-size:25px;font-weight:500;font-family:微软雅黑}
        .in_left a{
            color:#333; text-decoration:none;
        }
        .in_left a:hover {
            color:#ffd800;
            text-decoration:underline;
        }
        .back {
             float:right;width:30%;  text-align:right;
             margin-top:20px;
        }
           
        .back_text {
            color:#333;
            text-decoration:none;
        }
            .back_text:hover {
                color:#ffd800;
                text-decoration:underline;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
       <div style="width:100%; height:170px;background:url(images/1.jpg)">
           <div class="title">图书馆管理系统</div>
           <br/>
           <br/>
           <br />
           <div class="in_left">
                <asp:LinkButton ID="linbt" runat="server" Text="管理员登录" OnClick="Entry"></asp:LinkButton>
           </div>
           <div class="back">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    当前时间：<asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>   
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
       </div>
        <hr/>
       
        <div style="width:100%;height:200px; text-align:center;font-family:微软雅黑; background-image:url(images/3.jpg)">
            <br />
            <p style="font-weight:bold; font-size:20px;">馆藏书目简单查询：</p>
            <p>请输入所查图书的<strong>书名或ISBN编号</strong>：
                <asp:TextBox ID="SearchName" runat="server"></asp:TextBox>
                &nbsp&nbsp&nbsp
                <asp:Button ID="bt1" runat="server" Text="开始检索" OnClick="Search" />
            </p>
        </div>
        <div style=" font-family:微软雅黑;background-image:url(images/3.jpg);">
        <div style="width:100%;height:500px;">
            <table style="width:100%">
	            <tr>
		            <td style="background-color:mediumspringgreen" colspan="2">
                        <span style="font-size: 15pt; color: #000000"><strong>图书借阅排行榜:</strong></span>
		            </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
                           AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" 
                           OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White" 
                           BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" >
                            <Columns>
                                <asp:HyperLinkField  HeaderText="图书ISBN编号" DataTextField = "ISBN" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "ShowBookInformation.aspx?BookId={0}" />
                                 <asp:HyperLinkField  HeaderText="图书名称" DataTextField = "vname" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "ShowBookInformation.aspx?BookId={0}" />
                                <asp:BoundField DataField="Classname" HeaderText="所属类别" />
                                <asp:BoundField DataField="Pbulish" HeaderText="出版社" />
                                <asp:BoundField DataField="Rprice" HeaderText="出租价格" />
                                <asp:BoundField DataField="LeftNum" HeaderText="库存数量" />
                                <asp:BoundField DataField="CountBorrow" HeaderText="借阅次数" />
                             </Columns>
                             <PagerSettings FirstPageText="首页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                                NextPageText="下一页" PreviousPageText="上一页" />
                             <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                             <RowStyle BackColor="White" ForeColor="#330099" />
                             <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                             <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" Wrap="True" />
                             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                       </asp:GridView>
                    </td>
                </tr>
                <tr>
                   <td style="text-align: left">
                       每页显示
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                             <asp:ListItem>10</asp:ListItem>
                             <asp:ListItem>20</asp:ListItem>
                             <asp:ListItem>30</asp:ListItem>
                             <asp:ListItem>40</asp:ListItem>
                             <asp:ListItem>50</asp:ListItem>
                        </asp:DropDownList>条记录</td>
                    <td style="text-align: right">
                    <asp:Label ID="lcurr" runat="server"></asp:Label></td>
                </tr>
            </table>

        </div>
        
            </div>


          </div>
        
      
    </form>
</body>
</html>
