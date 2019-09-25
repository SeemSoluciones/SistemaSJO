<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PanelPricipal.aspx.cs" Inherits="UI.PanelPricipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  
<style type="text/css">
    .panel .panel-heading a{
        color:white;
    }
    
</style>

<div class="row">
    <div class="col-lg-3 col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <a href="Caja.aspx">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                             <i class="fa fa-money fa-5x">
                             
                           </i>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="huge">Ventas</div>
                        </div>
                    </div>
                </a>
            </div>
            <a href="ReporteVentas.aspx">
                <div class="panel-footer">
                    <span class="pull-left">Reporte de Ventas</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div> 
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <a href="Compra.aspx">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <i class="fa fa-cart-arrow-down fa-5x">
                             
                            </i>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="huge">Compras</div>
                        </div>
                    </div>

                 </a>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">Reporte de compras</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <a href="Stock.aspx">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <i class="fa fa-archive fa-5x">
                              
                                </i>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="huge">Inventario</div>
                        </div>
                    </div>
                    </a>
                </div>
            <a href="Stock.aspx">
                <div class="panel-footer">
                    <span class="pull-left">Reporte de inventario</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <a href="Cliente.aspx">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <i class="fa fa-users fa-5x">
                                
                            </i>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="huge">Clientes</div>
                        </div>
                    </div>
                    </a>
         </div>
            <a href="Credito2.aspx">
                <div class="panel-footer">
                    <span class="pull-left">Créditos del Clientes</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
    <div class="col-lg-3 col-xs-6">
     </div>
    <div class="col-lg-5">
        <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Calendario</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-black">
              <div class="row">
                
                <!-- /.col -->
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
    </div>
 
    </asp:Content>
