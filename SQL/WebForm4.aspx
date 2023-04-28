<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="SQL.WebForm4" %>

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
        /* .blood{
            display:none;
        }*/
       
    </style>
</head>
<body>
                                <button type="button" id="slewrtButton" class="btn btn-primary" onclick="alertclick()">Submit</button>
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
                        <form id="form2">
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
    <div id="registration" hidden="hidden">
        <form id="form1" runat="server">
            <div>
                <center>
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
                        <label for="dob">Date of Birth:</label>
                        <input placeholder="Select date" type="date" id="dob" min="1980-01-01" max="2008-12-31" />
                    </div>
                    <div>
                        <label for="Hospital">Hospital:</label>
                        <select name="Hospital" id="Hospital">
                            <option value="select" disabled="disabled" selected="selected">Select</option>
                            <option>Apollo Hospital</option>
                            <option>GOV Hospital</option>
                            <option>Billroth Hospital</option>
                            <option>Malar Hospital</option>
                            <option>Kalyani Hospital</option>
                        </select>
                    </div>
                    <div>
                        <label for="symtoms">symtoms</label>
                        <select name="symtoms" id="symtoms" class="select2_tags" multiple="multiple"></select>
                    </div>
                    <div>
                        <label for="Disease">Disease:</label><br />
                        <input type="checkbox" id="BP" name="disease" value="BP" />
                        <label for="BP">BP</label><br />
                        <input type="checkbox" id="Sugar" name="disease" value="Sugar" />
                        <label for="Sugar">Sugar</label><br />
                        <input type="checkbox" id="Diabetes" name="disease" value="Diabetes" />
                        <label for="Diabetes">Diabetes</label><br />
                        <input type="checkbox" id="HIV" name="disease" value="HIV" />
                        <label for="HIV">HIV</label>
                    </div>
                    <div>
                        <label for="Phone">Phone.no:</label>
                        <input type="tel" id="Phone" name="Phone.no" minimumlength="09" maxlength="10" />
                    </div>
                    <div>
                        <center>
                            <button type="button" id="submitButton" class="btn btn-primary" onclick="submitclick()">Submit</button>
                            <button type="button" id="CancelButton" class="btn btn-primary" onclick="Cancelclick()" hidden="hidden">Cancel</button>
                        </center>
                    </div>
                </center>
            </div>
        </form>
    </div>
    <div>
        <table id="example" class="display" style="width: 100%">
            <thead>
                <tr>
                    <th></th>
                    <th>personName</th>
                    <th>FatherName</th>
                    <th>Gender</th>
                    <th>dob</th>
                    <th>Hospital</th>
                    <th>symtoms</th>
                    <th>disease</th>
                    <th>Phone</th>
                    <th>Blood_Bank_Name</th>
                    <th>Blood_Group</th>
                    <%--<th>Select</th>--%>
                </tr>
            </thead>
        </table>
    </div>
    <script>
        function alertclick() {
            Swal.fire({
                icon: 'success',
                title: 'Successfully Registered',
                showConfirmButton: true,
            });
        }
        $(document).ready(function () {
            bankname();
            //  window.location.href = "https://localhost:44334/blood.aspx";
        });
        function bankname() {
            $.ajax({
                type: "POST",
                url: "WebForm4.aspx/Getbank",
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
                url: "WebForm4.aspx/Getblooodgroup",
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
                url: "WebForm4.aspx/Getblood",
                data: JSON.stringify({ Blood_Bank_Name: Blood_Bank_Name, Blood_Group: Blood_Group }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //  alert("Successfully get data from datatables");
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
                                // window.location.href = newpath;
                                // window.history.replaceState(newpath);
                                window.history.pushState({}, '', newpath);
                                $("#modal").hide();
                                $('#myModal').modal('hide');
                                // $("#registration").show();
                                $("#registration").attr("hidden", false);
                                //   $('#myModal').modal('hide');
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
       // console.log(myUrl);
        function clearfields() {
            document.getElementById("form2").reset();
        }

        $(document).ready(function () {
            $('.select2_tags').select2({
                placeholder: "Select",
                data: ["Fever", "Cough", "Headache", "Depression"]
            })
            getdata();
        });
        function submitclick() {
            debugger
            // Get form field values
            var personName = $("#personName").val();
            var FatherName = $("#FatherName").val();
            var Gender = $("input[name='Gender']:checked").val();
            var dob = $("#dob").val();
            var Hospital = $("#Hospital").val();
            var symtoms = $('#symtoms').select2('data').map(val => val.text).join(',');
            var disease = $("input[name='disease']:checked").map(function () { return $(this).val(); }).get().join(',');
            var Phone = $("#Phone").val();

            var myUrl = new URL(window.location.href);
            var id = myUrl.search.slice(1).split("&")[0].split("=")[1]
            var bloodid = myUrl.search.slice(1).split("&")[1].split("=")[1]
           /* console.log(bankid);
            console.log(bloodid);*/
           /* var Blood_Bank_Name = bankid;
            var Blood_Group = bloodid;*/

           /* let url = new URL('www.examplesite.com?yourname%20=gilgilad');
            var desire = url.search.slice(1).split("&")[0].split("=")[1]
            console.log(desire);*/
           /* var url_string = "http://www.example.com/t.html?a=1&b=3&c=m2-m3-m4-m5";
            var url = new URL(url_string);
            var c = url.searchParams.get("c");
            console.log(c);*/
            $.ajax({
                type: "POST",
                url: "WebForm4.aspx/insertdetails",
                data: JSON.stringify({ personName: personName, FatherName: FatherName, Gender: Gender, dob: dob, Hospital: Hospital, symtoms: symtoms, disease: disease, Phone: Phone, id: id, bloodid: bloodid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                  //  alert("Successfully Registered")
                    //var data_table = JSON.parse(response.d);
                    // table.rows.add(data_table).draw(); // clear the table and add the new rows
                    getdata();
                    clearfields();
                    var myUrl = new URL("https://localhost:44334/WebForm4.aspx");
                    if (myUrl = "https://localhost:44334/WebForm4.aspx") {
                        alert("Successfully Registered");
                        Swal.fire({
                            icon: 'success',
                            title: 'Successfully Registered',
                            showConfirmButton: true,
                        });
                        window.location.href = myUrl;
                    }
                    else {
                        alert("url is not matched");
                    }

                    /* let url = new URL(location.href);
                     url.searchParams.delete('page');
                     if (location.href.includes('?')) {
                         history.pushState({}, null, location.href.split('?')[0]);
                     }*/
                    //   updateQueryStringParam('myparam', 'true');
                    //   updateQueryStringParam('myparam', null);
                    //   url = removeURLParameter("Blood_Bank_Name", myUrl)
                    url = location.href;
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
                '<th>personName:</th>' +
                '<td>' +
                d.personName +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<th>Phone:</th>' +
                '<td>' +
                d.Phone +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<th>symtoms and disease:</th>' +
                '<td>' +
                '<input type="text" value="' + d.symtoms + "," + d.disease + '">' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<th>Extra info:</th>' +
                '<td>And any further details here (images etc)...</td>' +
                '</tr>' +
                '</table>'
            );
        }
        var tableInitialized = false; // keep track of whether the DataTable has been initialized
        function getdata() {
            debugger
            $.ajax({
                type: "POST",
                url: "WebForm4.aspx/Getdetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert("Successfully get data from datatables");
                    debugger
                    var data = JSON.parse(response.d);
                    if (tableInitialized) {
                        $('#example').DataTable().destroy(); // destroy the existing DataTable
                    } else {
                        tableInitialized = true;
                    }
                    var table = $('#example').DataTable({
                        data: data,
                        stateSave: true,
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
                            { data: 'Hospital' },
                            { data: 'symtoms' },
                            { data: 'disease' },
                            { data: 'Phone' },
                            { data: 'Blood_Bank_Name' },
                            { data: 'bloodgroup' }
                        ],
                        dom: 'PlBfrtip',
                        columnDefs: [
                            {
                                searchPanes: {
                                    show: true
                                },
                                targets: [2]
                            },
                             {
                                'targets': 0,
                                'checkboxes': {
                                    'selectRow': true
                                }
                            }
                        ],
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
                            },
                        ]
                    });
                    $('#example tbody').on('click', 'td.dt-control', function () {
                        var tr = $(this).closest('tr');
                        var row = table.row(tr);
                      //  row.child(format(row.data())).show();
                      //  row.child.toggle();
                      //  $(this).closest('td.dt-control').next('tr').toggle();
                     //   $(this).next().toggle();
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
                    /*var data_table = JSON.parse(response.d);
                    table.rows.add(data_table).draw(); // clear the table and add the new rows*/
                    clearfields();
                },
                error: function () {
                    alert('Error retrieving data!');
                }
            });
        }
        function answer() {
        }
        function Cancelclick() {
            clearfields();
        }
        function clearfields() {
            document.getElementById("form1").reset();
            $('#symtoms').val([]).trigger('change');
        }
    </script>
</body>
</html>
<%-- const urlParams = new URLSearchParams(window.location.search);
       urlParams.set('Name', 'Pavi');
     //  window.location.search = urlParams;

        /* function insertParam(key, value) {
             key = encodeURIComponent(key);
             value = encodeURIComponent(value);
 
             // kvp looks like ['key1=value1', 'key2=value2', ...]
             var kvp = document.location.search.substr(1).split('&');
             let i = 0;
 
             for (; i < kvp.length; i++) {
                 if (kvp[i].startsWith(key + '=')) {
                     let pair = kvp[i].split('=');
                     pair[1] = value;
                     kvp[i] = pair.join('=');
                     break;
                 }
             }
 
             if (i >= kvp.length) {
                 kvp[kvp.length] = [key, value].join('=');
             }
 
             // can return this or...
             let params = kvp.join('&');
 
             // reload page with new params
             document.location.search = params;
         }*/

        // window.location.replace("http:www.example.com");
        /* function addparams(key, value) {
             const myUrl = new URL(window.location.href);
             myUrl.searchParams.set(key, value);
             const newpath = window.location.pathname + "?" +
                 myUrl.toString();
             histor.pushState(null, "", newpath);
         }
         addparams()*/

        const myUrl = new URL(window.location.href);
        /*   myUrl.hostname = 'google.com';
           myUrl.search = "?name=pavi&age=21";
           myUrl.searchParams.set("name", "pavi");
           myUrl.searchParams.set("age", "21");*/
        myUrl.searchParams.set("name", "pavi");
        console.log(myUrl.searchParams.get("Blood_Bank_Name"));--%>