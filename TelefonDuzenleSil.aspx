<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="TelefonDuzenleSil.aspx.cs" Inherits="TelefonWeb.TelefonDuzenleSil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Telefon Düzenleme/Silme/Güncelleştirme Sayfası </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-20 grid-margin-left stretch-card">
        <div class="card">
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka </label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="Dropdownmarka" runat="server"  disabled>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Model</label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="Dropdownmodel" runat="server" disabled>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Hafıza</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txthafıza" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ekran Boyutu </label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtekran" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Kamera Çözünürlüğü</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtkamera" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ön Kamera</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtonkamera" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Pil Gücü </label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtpil" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ram</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtram" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Parmak izi/Yüz tanıma</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtparmak" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Rengi </label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtrengi" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Garanti Süresi</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtgaranti" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Satış Fiyatı</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtfiyat" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label>Fotoğraf Yükle</label>
                        <input type="text" name="img[]" class="file-upload-default">
                        <div class="input-group col-6">
                            <input type="text" class="form-control file-upload-info" disabled placeholder="JPG/JPEG/PNG olarak yükleme işlemini yapınız. ">
                            <div class="col-sm-9">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div>
                            <asp:Label ID="lblresim" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Guncelle_Click" Text="GÜNCELLE" />
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>"
                        DeleteCommand="DELETE FROM [Telefon] WHERE [Tel_ID] = @Tel_ID"
                        InsertCommand="INSERT INTO [Telefon] ([marka], [model], [hafıza], [ekran_boyutu], [kamera_coz], [on_kamera], [pil_gucu], [ram], [parmakızı_yuztanıma], [rengı], [garantı_suresi], [fıyat], [fotograf_yukle]) VALUES (@marka, @model, @hafıza, @ekran_boyutu, @kamera_coz, @on_kamera, @pil_gucu, @ram, @parmakızı_yuztanıma, @rengı, @garantı_suresi, @fıyat, @fotograf_yukle)"
                        SelectCommand="SELECT * FROM [Telefon] t LEFT JOIN [Marka] m ON t.marka = m.ID LEFT JOIN [Model] mo ON t.model = mo.ID"
                        UpdateCommand="UPDATE [Telefon] SET [marka] = @marka, [model] = @model, [hafıza] = @hafıza, [ekran_boyutu] = @ekran_boyutu, [kamera_coz] = @kamera_coz, [on_kamera] = @on_kamera, [pil_gucu] = @pil_gucu, [ram] = @ram, [parmakızı_yuztanıma] = @parmakızı_yuztanıma, [rengı] = @rengı, [garantı_suresi] = @garantı_suresi, [fıyat] = @fıyat WHERE [Tel_ID] = @Tel_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="Tel_ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="marka" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hafıza" Type="String" />
                            <asp:Parameter Name="ekran_boyutu" Type="String" />
                            <asp:Parameter Name="kamera_coz" Type="String" />
                            <asp:Parameter Name="on_kamera" Type="String" />
                            <asp:Parameter Name="pil_gucu" Type="String" />
                            <asp:Parameter Name="ram" Type="String" />
                            <asp:Parameter Name="parmakızı_yuztanıma" Type="String" />
                            <asp:Parameter Name="rengı" Type="String" />
                            <asp:Parameter Name="garantı_suresi" Type="String" />
                            <asp:Parameter Name="fıyat" Type="Int32" />
                            <asp:Parameter Name="fotograf_yukle" Type="Object" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="marka" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hafıza" Type="String" />
                            <asp:Parameter Name="ekran_boyutu" Type="String" />
                            <asp:Parameter Name="kamera_coz" Type="String" />
                            <asp:Parameter Name="on_kamera" Type="String" />
                            <asp:Parameter Name="pil_gucu" Type="String" />
                            <asp:Parameter Name="ram" Type="String" />
                            <asp:Parameter Name="parmakızı_yuztanıma" Type="String" />
                            <asp:Parameter Name="rengı" Type="String" />
                            <asp:Parameter Name="garantı_suresi" Type="String" />
                            <asp:Parameter Name="fıyat" Type="Int32" />
                            <asp:Parameter Name="fotograf_yukle" Type="Object" />
                            <asp:Parameter Name="Tel_ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Tel_ID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="False" ShowSelectButton="True" />
                            <asp:BoundField DataField="Tel_ID" HeaderText="Tel_ID" InsertVisible="False" ReadOnly="True" SortExpression="Tel_ID" />
                            <asp:BoundField DataField="Marka_adı" HeaderText="marka" SortExpression="marka" />
                            <asp:BoundField DataField="Model_adı" HeaderText="model" SortExpression="model" />
                            <asp:BoundField DataField="hafıza" HeaderText="hafıza" SortExpression="hafıza" />
                            <asp:BoundField DataField="ekran_boyutu" HeaderText="ekran_boyutu" SortExpression="ekran_boyutu" />
                            <asp:BoundField DataField="kamera_coz" HeaderText="kamera_coz" SortExpression="kamera_coz" />
                            <asp:BoundField DataField="on_kamera" HeaderText="on_kamera" SortExpression="on_kamera" />
                            <asp:BoundField DataField="pil_gucu" HeaderText="pil_gucu" SortExpression="pil_gucu" />
                            <asp:BoundField DataField="ram" HeaderText="ram" SortExpression="ram" />
                            <asp:BoundField DataField="parmakızı_yuztanıma" HeaderText="parmakızı_yuztanıma" SortExpression="parmakızı_yuztanıma" />
                            <asp:BoundField DataField="rengı" HeaderText="rengı" SortExpression="rengı" />
                            <asp:BoundField DataField="garantı_suresi" HeaderText="garantı_suresi" SortExpression="garantı_suresi" />
                            <asp:BoundField DataField="fıyat" HeaderText="fıyat" SortExpression="fıyat" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
