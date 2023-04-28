<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="SQL.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Jquery-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!--CSS-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <!--Buttons-->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" />
    <!--search panes-->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.2/css/searchPanes.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.6.2/css/select.dataTables.min.css" />
   <%-- <!--DataTables moment to change date formate-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>--%>
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
    <button type="button" id="modal" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        <i class="fa fa-envelope" style='color: blanchedalmond'></i>Form
   
    </button>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                        <h4 class="modal-title">HEALTH CARE🏥</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="form1" runat="server">
                        <div>
                            <label for="personName">PersonName:</label>
                            <input type="text" id="personName" />
                        </div>
                        <div>
                            <label for="FatherName">FatherName:</label>
                            <input type="text" id="FatherName" />
                        </div>
                        <div>
                            <label for="Gender">Gender:</label><br />
                            <input type="radio" id="Male" name="Gender" value="Male" />
                            <label for="Male">Male</label><br />
                            <input type="radio" id="Female" name="Gender" value="Female" />
                            <label for="Female">Female</label>
                        </div>
                        <div>
                            <label for="symtoms">symtoms:</label><br />
                            <input type="checkbox" id="Fever" name="symtoms" value="Fever" />
                            <label for="Fever">Fever</label><br />
                            <input type="checkbox" id="Cough" name="symtoms" value="Cough" />
                            <label for="Cough">Cough</label><br />
                            <input type="checkbox" id="Headache" name="symtoms" value="Headache" />
                            <label for="Headache">Headache</label><br />
                            <input type="checkbox" id="Depression" name="symtoms" value="Depression" />
                            <label for="Depression">Depression</label>
                        </div>
                        <div>
                            <label for="dob">Date of Birth:</label>
                            <input placeholder="Select date" type="date" id="dob" min="1980-01-01" max="2008-12-31" />
                        </div>
                        <div>
                            <label for="country">country:</label>
                            <select id="country" name="country">
                            </select>
                        </div>
                        <div>
                            <label for="ECA">ECA:</label>
                            <select name="ECA" class="js-example-basic-multiple" id="ECA" placeholder="Select" multiple="multiple">
                                <option>Athelitics</option>
                                <option>Cricket</option>
                                <option>Kabbadi</option>
                                <option>Football</option>
                                <option>Shuttle</option>
                                <option>Chess</option>
                                <option>Carrom</option>
                            </select>
                        </div>
                        <div>
                            <label for="Phone">Phone.no:</label>
                            <input type="tel" id="Phone" name="Phone.no" minimumlength="09" maxlength="10" />
                        </div>
                        <div>
                            <center>
                                <button type="button" id="submitButton" class="btn btn-primary" onclick="submitclick()">Submit</button>
                                <button type="button" id="updateButton" class="btn btn-primary" onclick="updateclick()" hidden="hidden">Update</button>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div>
        <table id="example" class="display" style="width: 100%">
            <thead>
                <tr>
                    <th>id</th>
                    <th></th>
                    <th>personName</th>
                    <th>FatherName</th>
                    <th>Gender</th>
                    <th>symtoms</th>
                    <th>dob</th>
                    <th>country</th>
                    <th>ECA</th>
                    <th>Phone</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            secondajaxcall();//to get data from database
            countryajaxcall();
            $('.js-example-basic-multiple').select2({
                placeholder: 'Select options',
            });
            //  $('td.dt-control').hide();
            /*  $('td.dt-control').click(function () {
                  $('#div' + $(this).attr('target')).toggle('').siblings('td.dt-control').hide('');
             });*/
        });
      //  var tableInitialized = false; // keep track of whether the DataTable has been initialized
        var childRowInitialized = null; // keep track of whether the childRow has been initialized
        function submitclick() {
            debugger
            // Get form field values
            var personName = $("#personName").val();
            var FatherName = $("#FatherName").val();
            var Gender = $("input[name='Gender']:checked").val();
            var symtoms = $("input[name='symtoms']:checked").map(function () { return $(this).val(); }).get().join(',');
            var dob = $("#dob").val();
            var country = $("#country").val();
            var ECA = $('#ECA').select2('data').map(val => val.text).join(',');
            var Phone = $("#Phone").val();
            $.ajax({
                type: "POST",
                url: "WebForm3.aspx/GetTable",
                data: JSON.stringify({ personName: personName, FatherName: FatherName, Gender: Gender, symtoms: symtoms, dob: dob, country: country, ECA: ECA, Phone: Phone }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    debugger
                    // alert("Successfully called webmethod");
                    //var data_table = JSON.parse(response.d);
                    // table.rows.add(data_table).draw(); // clear the table and add the new rows
                    $('#myModal').modal('hide');
                    secondajaxcall();
                    clearfields();
                },
                error: function () {
                    alert('Some error occurred!');
                }
            });
        }
        function format(d) {
            // `d` is the original data object for the row
            return (
                '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                '<tr>' +
                '<td>personName:</td>' +
                '<td>' +
                d.personName +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Phone:</td>' +
                '<td>' +
                d.Phone +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Extra info:</td>' +
                '<td>And any further details here (images etc)...</td>' +
                '</tr>' +
                '</table>'
            );
        }
        function secondajaxcall() {
            debugger
            $.ajax({
                type: "POST",
                url: "WebForm3.aspx/GetTable2",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    debugger
                    var data = JSON.parse(response.d);
                    /* if (tableInitialized) {
                         $('#example').DataTable().destroy(); // destroy the existing DataTable
                     } else {
                         tableInitialized = true;
                     }*/
                    if ($.fn.DataTable.isDataTable('#example')) {
                        debugger
                       // childRowInitialized = $('#example').DataTable().rows($('.shown'));
                        //table.clear().rows.add(JSON.parse(data)).draw();
                        $('#example').DataTable().clear().rows.add(data).draw();
                    }
                    else {
                        //tableInitialized = true;
                        var table = $('#example').DataTable({
                            data: data,
                            stateSave: true,
                            columns: [
                                { data: 'id' },
                                {
                                    className: 'dt-control',
                                    orderable: false,
                                    data: null,
                                    defaultContent: '',
                                },
                                { data: 'personName' },
                                { data: 'FatherName' },
                                { data: 'Gender' },
                                { data: 'symtoms' },
                                {
                                    data: 'dob',
                                    "render": function (data) {
                                        var date = new Date(data);
                                        var month = date.getMonth() + 1;
                                        var day = date.getDate();
                                        return date.getFullYear() + "/"
                                            + (month.length > 1 ? month : "0" + month).slice(-2) + "/"
                                            + ("0" + day).slice(-2);
                                        //return date format like 2000/01/01;
                                    }
                                },
                                { data: 'country' },
                                { data: 'ECA' },
                                { data: 'Phone' },
                                {
                                    data: null,
                                    render: function (data, type, row, meta) {
                                        return '<button type="button" onclick="editclick(' + meta.row + ')"><i class="fa fa-pencil-square-o"></i> Edit</button>';
                                    }
                                },
                                {
                                    data: null,
                                    render: function (data, type, row, meta) {
                                        return '<button type="button" id="deletebutton" onclick="deleteclick(' + meta.row + ')"><i class="fa fa-trash-o"></i> Delete</button>';
                                    }
                                }
                            ],
                            columnDefs: [
                                {
                                    target: 0,
                                    visible: false,
                                }
                            ],
                            /*  columnDefs: [
                                  {
                                      targets: 5,
                                      render: DataTable.render.datetime('Do MMM YYYY'),
                                  },
                              ],*/
                            /* columnDefs: [
                                  {
                                      targets: 5,
                                      render: function (data, type, row) {
                                          return moment(data).format('YYYY/MM/DD');
                                      }
                                  }
                              ],*/
                            dom: 'PlBfrtip',
                            buttons: [
                                {
                                    extend: 'copy',
                                    text: 'Copy to clipboard',
                                    key: {
                                        key: 'c',
                                        altKey: true
                                    }
                                },
                                {
                                    extend: 'excel',
                                    filename: 'DataTables',
                                    title: 'DatablesTable', // Add a title to the Excel file
                                    messageTop: 'Information', // Add a title to the Excel file
                                    messageBottom: 'The End',
                                    exportOptions: {
                                        columns: [2, 3, 4, 5, 6, 7, 8] // Specify which columns to include
                                        //   rows:[0, 1],
                                    }
                                },
                                {
                                    extend: 'pdf',
                                    filename: 'DataTables',
                                    exportOptions: {
                                        columns: [2, 3, 4, 5, 6, 7, 8] // Specify which columns to include
                                        //   rows:[0, 1],
                                    }
                                },
                                {
                                    extend: 'print',
                                    text: 'Print',
                                    exportOptions: {
                                        columns: [2, 3, 4, 5, 6, 7, 8] // Specify which columns to include
                                        //  rows:[0, 1],
                                    },
                                    key: {
                                        key: 'p',
                                        altKey: true
                                    }
                                }
                            ]
                        });
                        $('#example tbody').on('click', 'td.dt-control', function () {
                            var tr = $(this).closest('tr');
                            var row = table.row(tr);
                            if (row.child.isShown()) {
                                row.child.hide();
                                tr.removeClass('shown');
                            } else {
                                row.child(format(row.data())).show();
                                tr.addClass('shown');
                            }
                        });
                    }
                      /*  if (childRowInitialized) {
                            childRowInitialized.every(function (rowIdx, tableLoop, rowLoop) {
                                d = this.data();
                                this.child($(format(d))).show();
                                this.nodes().to$().addClass('shown');
                            });
                            // Reset childRows so loop is not executed each draw
                            childRowInitialized = null;
                        }*/
                },
                error: function () {
                    alert('Error retrieving data!');
                }
            });
        }

        function countryajaxcall() {
            $.ajax({
                type: "POST",
                url: "WebForm3.aspx/GetTable3",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // alert("Successfully called countryajaxcall");
                    var dropdown = $("#country");
                    dropdown.append('<option value="select" disabled="disabled" selected="selected">select</option>');
                    $.each(response.d, function (index, item) {
                        dropdown.append('<option value="' + item.DisplayText + '">' + item.DisplayText + '</option>');
                    });
                    //var data_table = JSON.parse(response.d);
                    //var dropdown = $("#country");
                    //dropdown.append("<option value='select' disabled='disabled' selected='selected'>select</option>");
                    //$.each(data_table, function (index, item) {
                    //    debugger
                    //    dropdown.append('<option value="' + item.ID + '">' + item.DisplayText + '</option>');
                    //});
                    // alert("Countries loaded successfully");
                },
                error: function () {
                    alert('Failed to load countries!');
                }
            });
        }
        function editclick(row) {
            $("#submitButton").hide();
            $("#updateButton").attr("hidden", false);

            var table = $('#example').DataTable();
            var rowData = table.row(row).data();

            $("#personName").val(rowData.personName);
            $("#FatherName").val(rowData.FatherName);
            $("input[name='Gender'][value='" + rowData.Gender + "']").prop('checked', true);
            var symtomsArray = rowData.symtoms.split(",");
            $.each(symtomsArray, function (index, value) {
                $("input[name='symtoms'][value='" + value + "']").prop('checked', true);
            });
            $("#dob").val(rowData.dob);
            $("#country").val(rowData.country);
            $('#ECA').val(rowData.ECA.split(",")).trigger('change');
            $("#Phone").val(rowData.Phone);

            // set the row index as data attribute on the update button
            $("#updateButton").data("rowIndex", row);
        }
        function updateclick() {
            debugger

            // Get form field values
            var personName = $("#personName").val();
            var FatherName = $("#FatherName").val();
            var Gender = $("input[name='Gender']:checked").val();
            var symtoms = $("input[name='symtoms']:checked").map(function () { return $(this).val(); }).get().join(',');
            var dob = $("#dob").val();
            var country = $("#country").val();
            var ECA = $('#ECA').select2('data').map(val => val.text).join(',');
            var Phone = $("#Phone").val();
            var rowIndex = $("#updateButton").data("rowIndex");
            var rowData = $('#example').DataTable().row(rowIndex).data();
            var prsnid = rowData.id;
            // Update the DataTable
            var table = $('#example').DataTable();
            table.row(rowIndex).data({
                "personName": personName,
                "FatherName": FatherName,
                "Gender": Gender,
                "symtoms": symtoms,
                "dob": dob,
                "country": country,
                "ECA": ECA,
                "Phone": Phone
            }).draw();

            // Update the database table
            $.ajax({
                type: "POST",
                url: "WebForm3.aspx/GetTable4",
                data: JSON.stringify({ id: prsnid, personName: personName, FatherName: FatherName, Gender: Gender, symtoms: symtoms, dob: dob, country: country, ECA: ECA, Phone: Phone }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    debugger
                    alert("Successfully updated data.");
                    clearfields();
                },
                error: function () {
                    debugger
                    alert('Some error occurred!');
                }
            });
        }
        function deleteclick(row) {
            debugger
            var table = $('#example').DataTable();
            var rowData = table.row(row).data();
            var prsnid = rowData.id;
            $.ajax({
                type: "POST",
                url: "WebForm3.aspx/GetTable5",
                data: JSON.stringify({ id: prsnid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    debugger
                    alert("Successfully updated data.");
                    table.row(row).remove().draw(); // remove the row from the DataTable
                    clearfields();
                },
                error: function () {
                    debugger
                    alert('Some error occurred!');
                }
            });
        }
        //Clear input fields in form
        function clearfields() {
            document.getElementById("form1").reset();
            $('#ECA').val([]).trigger('change');
        }
       /* function format(rowData) {
                  var html = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
                  html += '<tr><td><strong>Symptoms:</strong></td><td>' + rowData.symtoms + '</td></tr>';
                  html += '<tr><td><strong>Date of Birth:</strong></td><td>' + rowData.dob + '</td></tr>';
                  html += '<tr><td><strong>Country:</strong></td><td>' + rowData.country + '</td></tr>';
                  html += '<tr><td><strong>ECA:</strong></td><td>' + rowData.ECA + '</td></tr>';
                  html += '<tr><td><strong>Phone:</strong></td><td>' + rowData.Phone + '</td></tr>';
                  html += '</table>';
                  return html;
              }*/
        /* function format(d) {
             // `d` is the original data object for the row
             return (
                 '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                 '<tr>' +
                 '<td>Full name:</td>' +
                 '<td>' +
                 d.personName +
                 '</td>' +
                 '</tr>' +
                 '<tr>' +
                 '<td>Phone number:</td>' +
                 '<td>' +
                 d.Phone +
                 '</td>' +
                 '</tr>' +
                 '<tr>' +
                 '<td>Extra info:</td>' +
                 '<td>And any further details here (images etc)...</td>' +
                 '</tr>' +
                 '</table>'
             );
         }
         $(document).ready(function () {
             var table = $('#example').DataTable({
                 ajax: '../ajax/data/objects.txt',
                 columns: [
                     {
                         className: 'dt-control',
                         orderable: false,
                         data: null,
                         defaultContent: '',
                     },
                     { data: 'id' },
                     { data: 'personName' },
                     { data: 'FatherName' },
                     { data: 'Gender' },
                     { data: 'symtoms' },
                     { data: 'dob' },
                     { data: 'country' },
                     { data: 'ECA' },
                     { data: 'Phone' },
                 ],
                 order: [[1, 'asc']],
             });
 
             // Add event listener for opening and closing details
             $('#example tbody').on('click', 'td.dt-control', function () {
                 var tr = $(this).closest('tr');
                 var row = table.row(tr);
 
                 if (row.child.isShown()) {
                     // This row is already open - close it
                     row.child.hide();
                     tr.removeClass('shown');
                 } else {
                     // Open this row
                     row.child(format(row.data())).show();
                     tr.addClass('shown');
                 }
             });
         });*/

    </script>
</body>
</html>

    