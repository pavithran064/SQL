<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SQL.WebForm1" %>

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
    </style>
</head>
<body>
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
            <label for="Native">Native:</label>
            <select id="Native" name="Native">
                <option value="select" disabled="disabled" selected="selected">select</option>
                <option value="Chennai">Chennai</option>
                <option value="Kanyakumari">Kanyakumari</option>
                <option value="Mannargudi">Mannargudi</option>
                <option value="Thiruvarur">Thiruvarur</option>
                <option value="Thanjavur">Thanjavur</option>
                <option value="Madurai">Madurai</option>
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
            <button type="button" id="submitButton" class="btn btn-primary" onclick="submitclick()">Submit</button>
            <button type="button" id="updateButton" class="btn btn-primary" onclick="updateclick()" hidden="hidden">Update</button>
        </div>
        <div>
            <table id="example" class="display" style="width: 100%">
                <thead>
                    <tr>
                        <th></th>
                        <th>personName</th>
                        <th>FatherName</th>
                        <th>Gender</th>
                        <th>symtoms</th>
                        <th>dob</th>
                        <th>Native</th>
                        <th>ECA</th>
                        <th>Phone</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
            </table>
        </div>
    </form>
        <script>
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
            $(document).ready(function () {
                $('.js-example-basic-multiple').select2({
                    placeholder: 'Select options',
                });
            });
            var table = $('#example').DataTable({
                columns: [
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
                    { data: 'dob' },
                    { data: 'Native' },
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
                            return '<button type="button" onclick="deleteclick(' + meta.row + ')"><i class="fa fa-trash-o"></i> Delete</button>';
                        }
                    }
                ],
                dom: 'PlBfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
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
            function submitclick() {
                debugger
                // Get form field values
                var personName = $("#personName").val();
                var FatherName = $("#FatherName").val();
                var Gender = $("input[name='Gender']:checked").val();
                var symtoms = $("input[name='symtoms']:checked").map(function () { return $(this).val(); }).get().join(',');
                var dob = $("#dob").val();
                var Native = $("#Native").val();
                var ECA = $('#ECA').select2('data').map(val => val.text).join(',');
                var Phone = $("#Phone").val();
                $.ajax({
                    type: "POST",
                    url: "WebForm1.aspx/GetTable",
                    data: JSON.stringify({ personName: personName, FatherName: FatherName, Gender: Gender, symtoms: symtoms, dob: dob, Native: Native, ECA: ECA, Phone: Phone }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        debugger
                        alert("Successfully called webmethod");
                        var data_table = JSON.parse(response.d);
                        table.rows.add(data_table).draw(); // clear the table and add the new rows
                        clearfields();
                    },
                    error: function () {
                        alert('Some error occurred!');
                    }
                });
            }   
            function editclick(rowIndex) {
                // get the selected row data
                var row = tableData[rowIndex];
                // populate the form fields with the row data
                $("#personName").val(row.Name);
                $("#FatherName").val(row.FatherName);
                $("input[name='Gender'][value='" + row.Gender + "']").prop('checked', true);
                var symtomsArray = row.symtoms.split(",");
                $.each(symtomsArray, function (index, value) {
                    $("input[name='symtoms'][value='" + value + "']").prop('checked', true);
                });
                $("#dob").val(row.dob);
                $("#Native").val(row.Native);
                $('#ECA').val(row.ECA.split(",")).trigger('change'); // fix select2 multiple select value
                $("#Phone").val(row.Phone);
                // hide the submit button and show the update button
                $("#submitButton").hide();
                $("#updateButton").show();
                // set the row index as data attribute on the update button
                $("#updateButton").attr("data-row-index", rowIndex);
            }
            function updateclick() {
                var rowIndex = $("#updateButton").attr("data-row-index");
                var updatedData = {
                    personName: $("#personName").val(),
                    FatherName: $("#FatherName").val(),
                    Gender: $("input[name='Gender']:checked").val(),
                    symtoms: $("input[name='symtoms']:checked").map(function () { return $(this).val(); }).get().join(','),
                    dob: $("#dob").val(),
                    Native: $("#Native").val(),
                    ECA: $('#ECA').select2('data').map(val => val.text).join(','),
                    Phone: $("#Phone").val(),
                };
                tableData[rowIndex] = updatedData;
                var table = $('#example').DataTable();
                table.row(rowIndex).data(updatedData).draw();
                clearfields();
                $("#submitButton").show();
                $("#updateButton").hide();
                $("#updateButton").removeAttr("data-row-index");
            }
            function deleteclick(rowIndex) {
                // remove the data from the tableData array
                tableData.splice(rowIndex, 1);

                // redraw the DataTable
                var table = $('#example').DataTable();
                table.clear().rows.add(tableData).draw();
            }
            //Clear input fields in form
            function clearfields() {
                document.getElementById("form1").reset();
                $('#ECA').val([]).trigger('change');
            }
        </script>
</body>
</html>
