<%@ Page Title="" Language="C#" MasterPageFile="~/LoyMark.Master" AutoEventWireup="true" CodeBehind="UsuarioCRUD.aspx.cs" Inherits="ChallengeLoyMark.UsuarioCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h3>Administración usuario</h3>
                    </div>
                    <div class="ibox-content">
                        <div class="col-lg-12">
                            <p style="color: red; font-style: italic">(*) Campos obligatorios</p>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Nombre <small style="color: red">(*)</small></label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Apellido <small style="color: red">(*)</small></label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Correo Electrónico <small style="color: red">(*)</small></label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control solo-enteros"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group" id="data_1">
                                    <label>Fecha nacimiento <small style="color: red">(*)</small></label>
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>País residencia <small style="color: red">(*)</small></label>
                                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <asp:CheckBox ID="chkRecibeInformacion" runat="server" Text=" ¿Recibe información?" CssClass="form-check custom-checkbox" />
                                </div>
                            </div>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClientClick="location.href='UsuarioList.aspx';return false;" />
                            <asp:Button ID="btnSave" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function pageLoad() {

            $('.solo-enteros').keyup(function () {
                this.value = (this.value + '').replace(/[^0-9]/g, '');
            });

            $(".select2").select2({
                width: '100%',
                theme: 'bootstrap4'
            });

            $('#data_1 .input-group.date').datepicker({
                todayBtn: "linked",
                showOn: 'button',
                language: "es",
                readonly: true,
                autoclose: true,
                todayHighlight: true,
                format: 'yyyy/mm/dd',
                endDate: new Date(),
                startDate: new Date('01/01/1900')

            });
        }
    </script>
</asp:Content>
