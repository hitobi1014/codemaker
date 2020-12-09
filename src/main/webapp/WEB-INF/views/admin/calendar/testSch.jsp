<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/list/main.css' rel='stylesheet' />

<script src='/fullcalendar/packages/core/main.js'></script>
<script src='/fullcalendar/packages/interaction/main.js'></script>
<script src='/fullcalendar/packages/daygrid/main.js'></script>
<script src='/fullcalendar/packages/timegrid/main.js'></script>
<script src='/fullcalendar/packages/list/main.js'></script>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

	   $('#calendar').fullCalendar({
	     header: {
	       left: 'prev,next today',
	       center: 'title',
	       right: 'month,agendaWeek,agendaDay'
	     },
	     defaultDate: '2016-09-12',
	     navLinks: true, // can click day/week names to navigate views
	     selectable: true,
	     selectHelper: true,
	     select: function(start, end) {
	       // Display the modal.
	       // You could fill in the start and end fields based on the parameters
	       $('.modal').modal('show');

	     },
	     eventClick: function(event, element) {
	       // Display the modal and set the values to the event values.
	       $('.modal').modal('show');
	       $('.modal').find('#title').val(event.title);
	       $('.modal').find('#starts-at').val(event.start);
	       $('.modal').find('#ends-at').val(event.end);

	     },
	     editable: true,
	     eventLimit: true // allow "more" link when too many events

	   });

	   // Bind the dates to datetimepicker.
	   // You should pass the options you need
	   $("#starts-at, #ends-at").datetimepicker();

	   // Whenever the user clicks on the "save" button om the dialog
	   $('#save-event').on('click', function() {
	     var title = $('#title').val();
	     if (title) {
	       var eventData = {
	         title: title,
	         start: $('#starts-at').val(),
	         end: $('#ends-at').val()
	       };
	       $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
	     }
	     $('#calendar').fullCalendar('unselect');

	     // Clear modal inputs
	     $('.modal').find('input').val('');

	     // hide modal
	     $('.modal').modal('hide');
	   });
	 });

</script>
<style>

body {
  margin: 40px 10px;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 900px;
  margin: 0 auto;
}

.contextmenu {
  display: none;
  position: absolute;
  width: 200px;
  margin: 0;
  padding: 0;
  background: #FFFFFF;
  border-radius: 5px;
  list-style: none;
  box-shadow:
    0 15px 35px rgba(50,50,90,0.1),
    0 5px 15px rgba(0,0,0,0.07);
  overflow: hidden;
  z-index: 999999;
}

.contextmenu li {
  border-left: 3px solid transparent;
  transition: ease .2s;
}

.contextmenu li a {
  display: block;
  padding: 10px;
  color: #B0BEC5;
  text-decoration: none;
  transition: ease .2s;
}

.contextmenu li:hover {
  background: #CE93D8;
  border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
  color: #FFFFFF;
}
</style>
</head>
<body>
<div id='calendar'></div>
<div id='datepicker'></div>

<div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Create new event</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="title">Event title</label>
                        <input type="text" name="title" id="title" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">Starts at</label>
                        <input type="text" name="starts_at" id="starts-at" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="ends-at">Ends at</label>
                        <input type="text" name="ends_at" id="ends-at" />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="save-event">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  

</body>
</html>
