<asp:GridView ID="gvEvents" runat="server" Width="687px"
    AutoGenerateColumns="False"
    DataKeyNames="EventID"
    OnRowEditing="gvEvents_RowEditing"
    OnRowCancelingEdit="gvEvents_RowCancelingEdit"
    OnRowUpdating="gvEvents_RowUpdating"
    OnRowDeleting="gvEvents_RowDeleting">
    <Columns>
        <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="EventName" HeaderText="Event Name" ReadOnly="True" />
        <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
        <asp:BoundField DataField="Skill" HeaderText="Skill" ReadOnly="True" />
        <asp:TemplateField HeaderText="Hours">
            <ItemTemplate>
                <%# Eval("WorkHours") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtWorkHours" runat="server" Text='<%# Bind("WorkHours") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>