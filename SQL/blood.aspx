<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blood.aspx.cs" Inherits="SQL.blood" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Jquery-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!--CSS-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <!--Sweetaert2-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <!--Buttons-->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" />
    <!--search panes-->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.2/css/searchPanes.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.6.2/css/select.dataTables.min.css" />
    <!--DataTables-->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <!--Bootsrtap-->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--Buttons-->
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <!--search panes-->
    <script src="https://cdn.datatables.net/searchpanes/2.1.2/js/dataTables.searchPanes.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.6.2/js/dataTables.select.min.js"></script>
    <!--fontsweaome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--Select2-->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    
    <title></title>
    <style>
        div {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 150px;
        }

        input, select {
            display: inline-block;
            width: 200px;
            padding: 5px;
            margin-bottom: 10px;
        }

        table, th, td {
            border: 1px solid;
        }

        table {
            width: 50%;
        }

        #modal {
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-style: solid;
            border-color: blanchedalmond;
            border-radius: 8px;
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="blood">
        <button type="button" id="modal" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Find_Blood🩸</button>
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">HEALTH CARE🏥</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="form2" runat="server">
                            <div>
                                <label for="Blood_Bank_Name">Blood_Bank_Name:</label>
                                <select name="Blood_Bank_Name" id="Blood_Bank_Name"></select>
                            </div>
                            <div>
                                <label for="Blood_Group">Blood_Group:</label>
                                <select name="Blood_Group" id="Blood_Group"></select>
                            </div>
                            <div>
                                <center>
                                    <button type="button" id="FindButton" class="btn btn-primary" onclick="Findclick()">Find</button>
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            bankname();
            //  window.location.href = "https://localhost:44334/blood.aspx";
        });
        function bankname() {
            $.ajax({
                type: "POST",
                url: "blood.aspx/Getbank",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert("Successfully called bankname");
                    var dropdown = $("#Blood_Bank_Name");
                    dropdown.append('<option value="select" disabled="disabled" selected="selected">select</option>');
                    $.each(response.d, function (index, item) {
                        dropdown.append('<option value="' + item.BankId + '">' + item.DisplayText + '</option>');
                    });
                },
                error: function () {
                    alert('Failed to load bankname!');
                }
            });
            $.ajax({
                type: "POST",
                url: "blood.aspx/Getblooodgroup",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // alert("Successfully called bankgroup"); 
                    var dropdown = $("#Blood_Group");
                    dropdown.append('<option value="select" disabled="disabled" selected="selected">select</option>');
                    $.each(response.d, function (index, item) {
                        dropdown.append('<option value="' + item.BloodId + '">' + item.DisplayText + '</option>');
                    });
                },
                error: function () {
                    alert('Failed to load bankgroup!');
                }
            });
        }
        var Blood_Bank_Name = $("#Blood_Bank_Name").val();
        var Blood_Group = $("#Blood_Group").val();
        function Findclick() {
            var Blood_Bank_Name = $("#Blood_Bank_Name").val();
            var Blood_Group = $("#Blood_Group").val();
            $.ajax({
                type: "POST",
                url: "blood.aspx/Getblood",
                data: JSON.stringify({ Blood_Bank_Name: Blood_Bank_Name, Blood_Group: Blood_Group }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // alert("Successfully get data from datatables");
                    var data = JSON.parse(response.d);
                    if (data == true) {
                        Swal.fire({
                            title: 'Do you want to Register for Blood',
                            showDenyButton: true,
                            showCancelButton: true,
                            confirmButtonText: 'Yes',
                            denyButtonText: 'No',
                            customClass: {
                                actions: 'my-actions',
                                cancelButton: 'order-1 right-gap',
                                confirmButton: 'order-2',
                                denyButton: 'order-3',
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                               /* var myUrl = new URL("https://localhost:44334/WebForm4.aspx");
                                var newpath = myUrl + "?" + "Blood_Bank_Name =" + Blood_Bank_Name + "&" + "Blood_Group =" + Blood_Group;
                                window.location.href = newpath;*/
                                var myUrl = new URL(window.location.href);
                                var newpath = myUrl + "?" + "Blood_Bank_Name =" + Blood_Bank_Name + "&" + "Blood_Group =" + Blood_Group;
                                window.location.href = newpath;
                            }
                        });
                    } else {
                        alert("blood not finded")
                    }
                    clearfields();
                },
                error: function () {
                    alert('Error retrieving data!');
                }
            });
        }
        Blood_Bank_Name = Blood_Bank_Name;
        Blood_Group = Blood_Group;
        var myUrl = new URL(window.location.href);
        myUrl.searchParams.set("Blood_Bank_Name", "Blood_Group");
        console.log(myUrl);
        function clearfields() {
            document.getElementById("form2").reset();
        }
    </script>
</body>
</html>
  <%--/* Blood_Bank_Name = Blood_Bank_Name;
                                Blood_Group = Blood_Group;*/
                                /*var myUrl = new URL(window.location.href);
                                myUrl.searchParams.set("Blood_Bank_Name", "Blood_Group");
                                console.log(myUrl);
                                window.location.href = "https://localhost:44334/WebForm4.aspx"; // Redirect to logged-in page*/
// myUrl.searchParams.set("(Blood_Bank_Name,('" + Blood_Bank_Name + "')),(Blood_Group,('" + Blood_Group + "'))");
                               // myUrl.searchParams.set("Blood_Bank_Name", "Blood_Group");
                                // myUrl.searchParams.set("Blood_Group", ('" + Blood_Group + "'));--%>