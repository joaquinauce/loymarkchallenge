<%@ Page Title="" Language="C#" MasterPageFile="~/LoyMark.Master" AutoEventWireup="true" CodeBehind="Actividades.aspx.cs" Inherits="ChallengeLoyMark.Actividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper wrapper-content animated fadeInRight">

        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h3>Listado de actividades</h3>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrillaActividades" runat="server" CssClass="table table-hover table-bordered table-striped" AllowPaging="true"
                                        AutoGenerateColumns="false" PageSize="10" OnPageIndexChanging="GrillaActividades_PageIndexChanging" AllowSorting="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Id" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblId" Text='<%#Eval("id_actividad") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Fecha de Actividad" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblCreateDate" Text='<%#Eval("create_date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nombre completo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblNombreCompleto" Text='<%#Eval("nombre_completo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Detalle actividad" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDetalleActividad" Text='<%#Eval("actividad") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <asp:Label runat="server" Text="No hay actividades cargadas..."></asp:Label>
                                        </EmptyDataTemplate>
                                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" FirstPageText="Primera" LastPageText="Última" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
</asp:Content>
