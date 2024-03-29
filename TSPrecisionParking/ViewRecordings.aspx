﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRecordings.aspx.cs" Inherits="TSPrecisionParking.ViewRecordings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul>
                <li>
                    <a href="index.aspx">index</a>
                </li>
                <li>
                    <a href="AddRecording_Testpage.aspx">Add Recordings</a>
                </li>
                <li>
                    <a href="ViewRecordings.aspx">View Recordings</a>
                </li>
            </ul>
        </div>
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
            <h4>Change Sensor</h4>
            <asp:DropDownList ID="ddlSensors" runat="server"
                DataSourceID="sqlsrcSensors" DataTextField="LocationName" DataValueField="SensorID"
                AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlSensors_SelectedIndexChanged">
                <asp:ListItem Text="All Sensors" Value="ALL" />
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="grdvwRecords"
                runat="server"
                DataSourceID="sqlsrcRecords"
                AllowSorting="true"
                AutoGenerateSelectButton="false"
                HorizontalAlign="Center"
                AutoGenerateColumns="false" DataKeyNames="SensorID">
                <Columns>
                    <asp:BoundField HeaderText="Sensor ID" DataField="SensorID" SortExpression="SensorID" />
                    <asp:BoundField HeaderText="Location" DataField="LocationName" SortExpression="LocationName" />
                    <asp:BoundField HeaderText="Record Timestamp (UTC)" DataField="RecordTimestamp" SortExpression="RecordTimestamp" />
                    <asp:BoundField HeaderText="Reading" DataField="Reading" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlsrcSensors" runat="server"
                ConnectionString="<%$ ConnectionStrings:TSPP %>"
                SelectCommand="SELECT Sensor.SensorID, LocationName 
                FROM Sensor JOIN Location ON Sensor.LocationID = Location.LocationID;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlsrcRecords" runat="server"
                ConnectionString="<%$ ConnectionStrings:TSPP %>"
                SelectCommand="SELECT Sensor.SensorID, LocationName, RecordTimestamp, Reading 
                FROM Record JOIN Sensor ON Record.SensorID = Sensor.SensorID 
                JOIN Location ON Sensor.LocationID = Location.LocationID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
