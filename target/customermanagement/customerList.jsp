<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Customer Lists</title>

<link rel="stylesheet" href="css/vendor.css" />
<link rel="stylesheet" href="css/app.css" />
<link rel="stylesheet" href="font-awesome/css/font-awesome.css" />
<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

</head>
<body>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>Customer List</h5>
						<div class="ibox-tools">
							<a class="btn btn-primary" data-toggle="modal" data-target="#new-customer"> <i class="fa fa-fw fa-plus"></i>New
								Customer
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<div class="table-responsive">
							<table
								class="table table-striped table-bordered table-hover dataTables">
								<thead>
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Gender</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Address</th>
										<th>DOB</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${rows}">
										<tr>
											<td>${row.getFistName() }</td>
											<td>${row.getLastName() }</td>
											<td>${row.getGender() }</td>
											<td><a href="#">${row.getEmail() }</a></td>
											<td>${row.getPhone() }</td>
											<td>${row.getAddress() }</td>
											<td>${row.getDOB() }</td>
											<td><a style="color: green;"
												onclick="editRow(${row.getID() })"><i
													class="fa fa-edit fa-fw"></i>Edit</a></td>
											<td><a style="color: red;"
												onclick="deleteRow(${row.getID() },'${row.getFistName() }',this)"><i
													class="fa fa-trash fa-fw"></i>Delete</a></td>
										</tr>

									</c:forEach>
								</tbody>

							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="edit-customer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Customer</h4>
				</div>
				<div id="message-body" class="modal-body">
					<div class="ibox float-e-margins">

						<div class="ibox-content">
							<form id="form" method="POST" action="editCustomer" class="form-horizontal">
							<input id="id" name="id" type="text"  required hidden>
								<div class="form-group">
									<label class="col-sm-2 control-label">Last Name</label>
									<div class="col-sm-10">
										<input id="last-name" type="text" name="last-name" class="form-control"
											placeholder="Last Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">First Name</label>
									<div class="col-sm-10">
										<input id="first-name" type="text" name="first-name" class="form-control"
											placeholder="First Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Gender</label>

									<div class="col-sm-10">
										<select id="gender" class="form-control" name="gender">
											<option id="m" value="Male">Male</option>
											<option id="f" value="Female">Female</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input id="email" type="text" name="email" class="form-control"
											placeholder="Email Address"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
											title="Please input correct email format" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Phone Number</label>
									<div class="col-sm-10">
										<input id="phone" type="text" name="phone" class="form-control"
											placeholder="Phone Number" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Address</label>
									<div class="col-sm-10">
										<input id="address" type="text" name="address" class="form-control"
											placeholder="Address" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Date Of Birth</label>
									<div class="col-sm-10">
										<input id="dob" type="text" name="dob" class="form-control datepicker"
											placeholder="Date Of Birth" required>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<div class="col-sm-12">
										<button class="btn btn-white pull-right" data-dismiss="modal"
											type="reset">Cancel</button>
										<button onclick="updateCustomer()" class="btn btn-primary pull-right" style="margin-right:10px;" type="submit">Save
											changes</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="new-customer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Customer</h4>
				</div>
				<div id="message-body" class="modal-body">
					<div class="ibox float-e-margins">

						<div class="ibox-content">
							<form id="form-new" method="POST" action="newCustomer" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">Last Name</label>
									<div class="col-sm-10">
										<input type="text" name="last-name" class="form-control"
											placeholder="Last Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">First Name</label>
									<div class="col-sm-10">
										<input type="text" name="first-name" class="form-control"
											placeholder="First Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Gender</label>

									<div class="col-sm-10">
										<select class="form-control" name="gender">
											<option id="m" value="Male">Male</option>
											<option id="f" value="Female">Female</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input type="text" name="email" class="form-control"
											placeholder="Email Address"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
											title="Please input correct email format" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Phone Number</label>
									<div class="col-sm-10">
										<input type="text" name="phone" class="form-control"
											placeholder="Phone Number" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Address</label>
									<div class="col-sm-10">
										<input type="text" name="address" class="form-control"
											placeholder="Address" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Date Of Birth</label>
									<div class="col-sm-10">
										<input type="text" name="dob" class="form-control datepicker"
											placeholder="Date Of Birth" required>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<div class="col-sm-12">
										<button class="btn btn-white pull-right" data-dismiss="modal"
											type="reset">Cancel</button>
										<button onclick="newCustomer()" class="btn btn-primary pull-right" style="margin-right:10px;" type="submit">Add
											</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Mainly scripts -->
	<script src="js/app.js" type="text/javascript"></script>
	<script src="js/plugins/dataTables/datatables.min.js"></script>
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="js/plugins/jquery-form.js"></script>

	<script>
	
	var newCustomer = function(){
		$("#form-new").ajaxForm({
			success:function(){
				alert("New Cucstomer is added successfully!");
				location.reload();
			}
		});
	}
	
	var updateCustomer = function(){
		$("#form").ajaxForm({
			success:function(){
				alert("Update successfully!");
				location.reload();
			}
		});
	}
	var deleteRow = function(id,name,obj){
		if(confirm("Are you sure you want to delete '"+name+"' ?'")){
			$.ajax({
				url:"deleteCustomer",
				data:{id:id},
				type:"POST",
				success:function(data){
					alert("Customer has been deleted!");
					location.reload();
				}
				
			});
		}
	}
	
    var editRow = function(id){
        $("#edit-customer").modal("show");
        $.ajax({
        	url:"loadCustomer",
        	data:{id:id},
        	type:"POST",
        	success:function(data){
        		var record = JSON.parse(data);
        		$("#id").val(record.id);
        		$("#last-name").val(record.lastName);
        		$("#first-name").val(record.firstName);
        		if(record.gender=='Male'){
        			$("#m").prop('selected',true);
        			$("#f").prop('selected',false);
        		}
        		else{
        			$("#m").prop('selected',false);
        			$("#f").prop('selected',true);
        		}
        		//$("#last-name").val(record.lastName);
        		$("#email").val(record.email);
        		$("#phone").val(record.phone);
        		$("#address").val(record.address);
        		$("#dob").val(record.dob);
        	}
        });
         
        };
            $(document).ready(function () {
            	$('.datepicker').datepicker({
                    todayBtn: "linked",
                    format: 'yyyy-mm-dd',
                    keyboardNavigation: false,
                    forceParse: false,
                    calendarWeeks: true,
                    autoclose: true
                });
                $('.dataTables').DataTable({
                    pageLength: 10,
                    responsive: true,
                    dom: '<"html5buttons"B>lTfgitp',
                    buttons: [
                        {extend: 'excel', title: 'Customer List'},
                        {extend: 'pdf', title: 'Customer List'},
                        {extend: 'print',
                            customize: function (win) {
                                consol.log('')
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                        .addClass('compact')
                                        .css('font-size', 'inherit');
                            }
                        }
                    ]

                });

            });

        </script>
</body>
</html>