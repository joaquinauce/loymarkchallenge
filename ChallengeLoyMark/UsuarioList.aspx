<%@ Page Title="" Language="C#" MasterPageFile="~/LoyMark.Master" AutoEventWireup="true" CodeBehind="UsuarioList.aspx.cs" Inherits="ChallengeLoyMark.UsuarioList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h3>Listado de usuarios</h3>
                    </div>

                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-lg-4 col-md-12 col-xs-12 col-sm-12">
                                <div class="form-group">
                                   <asp:CheckBox ID="chkMostrarEliminados" runat="server" CssClass="form-check" Text=" Mostrar eliminados" AutoPostBack="true" OnCheckedChanged="chkMostrarEliminados_CheckedChanged"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pull-right">
                                    <div class="form-group">
                                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClientClick="location.href='UsuarioCRUD.aspx';return false;"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GrillaUsuarios" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                                                AllowSorting="true" PageSize="10" DataKeyNames="id_usuario" CssClass="table table-striped table-bordered table-hover"
                                                OnRowCommand="GrillaUsuarios_RowCommand" OnRowDataBound="GrillaUsuarios_RowDataBound"
                                                OnPageIndexChanging="GrillaUsuarios_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="IdUsuario" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblId" Text='<%#Eval("id_usuario") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Apellido" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="apellido" Text='<%# Eval("apellido") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="nombre" Text='<%# Eval("nombre") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="email" Text='<%# Eval("email") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fecha nacimiento" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="fechaNacimiento" Text='<%# Eval("fecha_nacimiento", "{0:dd/MM/yyyy}") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Telefono" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="telefono" Text='<%# Eval("telefono") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Residencia" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="nombrePais" Text='<%# Eval("nombre_pais") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Recibe información" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="recibeInformacion" Text='<%# Eval("recibe_informacion") %>' Visible="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Acciones" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="240" FooterStyle-Width="150" ItemStyle-Width="250px">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="iBtnVer" runat="server" CssClass="btn btn-outline-blue dim" CausesValidation="false" ToolTip="visualizar" OnClientClick=<%# string.Format("location.href='UsuarioCRUD.aspx?edit=0&id={0}'; return false;", Eval("id_usuario")) %>><i class="fa fa-search"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="ibtnModificar" runat="server" CssClass="btn btn-outline-yellow dim" Text="Eliminar" CausesValidation="false" ToolTip="Modificar"  Visible='<%# Eval("fecha_baja") == DBNull.Value%>' OnClientClick=<%# string.Format("location.href='UsuarioCRUD.aspx?edit=1&id={0}'; return false;", Eval("id_usuario")) %>><i class="fa fa-edit"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="ibtnEliminar" runat="server" CssClass="btn btn-outline-red dim" CausesValidation="false" ToolTip="Eliminar" CommandName="Eliminar" Visible='<%# Eval("fecha_baja") == DBNull.Value%>' CommandArgument='<%# Eval("id_usuario")%>'><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="100px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label runat="server" Text="No hay usuarios cargados..."></asp:Label>
                                                </EmptyDataTemplate>
                                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" FirstPageText="Primera" LastPageText="Última" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <asp:UpdatePanel ID="upnlGeneric" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnConfirmarEliminar" runat="server" Style="display: none;" OnClick="btnConfirmarEliminar_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript">

        function pageLoad() {


            $(".select2").select2({
                width: '100%',
                theme: 'bootstrap4'
            });           
        };

        window.addEventListener('keydown', function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                return false;
            }
        });

    </script>
</asp:Content>
