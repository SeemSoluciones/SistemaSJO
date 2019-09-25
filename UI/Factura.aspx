<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="UI.Factura" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        #BtnImprimir {
    border: 1px solid transparent;
                     }
    #BtnImprimir:hover {
    border: 1px solid rgb(51,102,153);
    background-color: rgb(221,238,247);
    cursor:pointer;
                      }
    </style>
   <script type="text/javascript" language="javascript">
       var urlImg = '<%=Page.ResolveUrl("~/Print_48px.png") %>';

      $(document).ready(function () {
      colocarBtnImprimir();  
      $("#BtnImprimir").click(imprimirDiv); 
        });


      function colocarBtnImprimir() {
      var jqoBarraRpt = $('div#ReportViewer1_ctl05>div:first-child');   

      if (jqoBarraRpt && jqoBarraRpt.length > 0    // Verificando que el DIV barra de herramientas fue encontrado,
        && jqoBarraRpt.find('#BtnImprimir').length <= 0) {    // y verificando que el botón de imprimir no existe ya

        jqoBarraRpt.append('<table cellpadding="0" cellspacing="0" ToolbarSpacer="true" style="display:inline;width:10px;"><tr><td></td></tr></table><div style="display:inline;font-family:Verdana;font-size:8pt;vertical-align:top;"><table cellpadding="0" cellspacing="0" style="display:inline;"><tr><td height="28px"><div"><div id="BtnImprimir"><table title="Print"><tr><td><img title="Print" src="' + urlImg + '" alt="Print" style="border-style:None;height:16px;width:16px;" /></td></tr></table></div><div disabled="disabled" style="display:none;border:1px transparent Solid;"><table title="Print"><tr><td><input type="image" disabled="disabled" title="Print" src="' + urlImg + '" alt="Print" style="border-style:None;height:16px;width:16px;cursor:default;" /></td></tr></table></div></div></td></tr></table></div>');
      }
      }

      function imprimirDiv()
      {
    var divImprimir = $("div[id$='ReportDiv']").parent();   
    var newWin = window.open();   
    newWin.document.open();   
    newWin.document.write('<html><head><style type="text/css">' + getAllStyleSheetsAsText() + '</style></head><body>' + divImprimir.html() + '</body>');
    newWin.document.close();
    newWin.print();
    newWin.close();
}

function getAllStyleSheetsAsText() {
    var cssText = '';
    var sheets = document.styleSheets;
    for (var c = 0; c < sheets.length; c++) {
        var sheet = sheets[c];
        if ((sheet.ownerNode || sheet.owningElement).id.endsWith('_ReportControl_styles')) {
            var rules = sheet.rules || sheet.cssRules;
            for (var r = 0; r < rules.length; r++) {
                var cssRule = rules[r];
                if ($.browser.msie) {
                    var cssText = cssText + cssRule.selectorText + '{' + cssRule.style.cssText.toLowerCase() + '}';
                } else {
                    var cssText = cssText + cssRule.cssText;
                }
            }
        }
    }
    return cssText;
    }
   </script>
    <title>Imprimir</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Imprmir" Height="26px" Width="86px" style="display:none" />
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="365px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1020px" AsyncRendering="False" InteractivityPostBackMode="AlwaysSynchronous" ShowPrintButton="False">
            <LocalReport ReportPath="Factura.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="UI.BDautorepuestoDataSetTableAdapters.ImprimirFacturaTableAdapter"></asp:ObjectDataSource>
    </div>
     
        <script src="<%=Page.ResolveUrl("~/Scripts/jquery-1.7.1.min.js") %>" type="text/javascript"></script>

    </form>
</body>
</html>
