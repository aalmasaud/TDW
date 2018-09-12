$(document).ready(function(){
  
  function readFile(ftype, myfile){
    //disable the button during upload
    $("#submitbutton").attr("disabled", "disabled");
	 

	$("#functC").text("");
        $("#key").text("");
        $("#location").text("");
	  $("#functR").text("readFile");
    $("#csvFileLink").removeAttr("href");
    //perform the request
    var req = ocpu.call("readFile", {
      type : ftype,
      file : myfile
    }, function(session){

		mysession = session;

		$("#functR").text("");
		$("#functC").text("readFile");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
      //on success call enrichTimestamp()
      readXLS(session);
	    //removeColumns(session);
    });
    
    //if R returns an error, alert the error message
    req.fail(function(){
      alert("Server error: " + req.responseText);
    });
    
    //after request complete, re-enable the button 
    req.always(function(){
      $("#submitbutton").removeAttr("disabled")
    });        
  }    
  

  function readXLS(mydata){
	$("#functR").text("readXLS");
	//perform the request
    var req = ocpu.call("readFile", {
      type : $("#ftype2").val(),
	  file : $("#fileaddr2").val()
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("readXLS");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
				      //on success call formatDateISO()
      formatDateISO(session);
		
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }
  
  function formatDateISO(mydata){
	$("#functR").text("formatDateTimeISO");
        $("#key").text("");
        $("#location").text("");
	//perform the request
    var req = ocpu.call("formatDateTimeISO", {
      dataFile : mydata,
      "fromColumn" : "Local_time_in_Manchester_(airport)",
      "toColumn" : "Time" 
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("formatDateTimeISO");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
				      //on success call RoundToNearestHour()
      FilterTime(session);
		
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }	

  function FilterTime(mydata){
	$("#functR").text("filterTime");
        $("#key").text("");
        $("#location").text("");
	//perform the request
      var req = ocpu.call("filterTime", {
     "dataFile" : mydata,
"time":"Y",
     "column" : "Time",
     "..." : 50
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("filterTime");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
				      //on success call RoundToNearestHour()
      //RoundToNearestHour(session);
		
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }	
	
  function enrichTimestamp(mydata){
	$("#functR").text("enrichTimestamp");

	//perform the request
    var req = ocpu.call("enrichTimedate", {
      dataFile : mydata,
	  fromColumn : "Date",
	  toColumn: "Date",
	  startDate: $("#startDate").val()
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("enrichTimedate");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
				      //on success call RoundToNearestHour()
      RoundToNearestHour(session);
		
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }
  
   function removeColumns(mydata){
	$("#functR").text("removeColumns");

	//perform the request
    var req = ocpu.call("removeColumn", {
     "dataFile" : mydata,
	 "..." : '["Flags","Weight__tonnes_","Flag_Text","Num_Axles","Axle_Weights__tonnes____","Axle_Spacings__m____","Vehicle_Id"]'
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("removeColumns");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
		      //on success call filter()
      filter(session);
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }

  
   function filter(mydata){
	$("#functR").text("filter");

	//perform the request
    var req = ocpu.call("filter2", {
     "dataFile" : mydata,
	    "time":"N",
	    "column":"Class",
	 "..." : "Class == 2"
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("filter");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
		      //on success call enrichTimestamp()
      enrichTimestamp(session);
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }

   function RoundToNearestHour(mydata){
	$("#functR").text("RoundToNearestHour");

	//perform the request
    var req = ocpu.call("roundToNearestHour", {
     "dataFile" : mydata,
	 "type" : "trunc",
	 "fromColumn" : "Date",
	 "toColumn" : "Hour"
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("RoundToNearestHour");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
		      //on success call RemoveOutliers()
      RemoveOutliers1(session);
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }

  
   function RemoveOutliers1(mydata){
	$("#functR").text("RemoveOutliers-Speed");

	//perform the request
    var req = ocpu.call("findOutliers", {
     "mydatafile" : mydata,
	 "dataColumn" : "Speed__mph_"
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("RemoveOutliers-Speed");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
		      //on success call RemoveOutliers2()
      RemoveOutliers2(session);
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }  
   function RemoveOutliers2(mydata){
	$("#functR").text("RemoveOutliers-Length");

	//perform the request
    var req = ocpu.call("findOutliers", {
     "mydatafile" : mydata,
	 "dataColumn" : "Length__m_"
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("RemoveOutliers-Length");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
			//on success create output file link
		$("#csvFileLink").attr("href", mysession.getLoc() + "R/.val/csv");
		      //on success call readXLS()
      readXLS(session);
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }

    
  
  
  $("#submitbutton").on("click", function(){
    
    //arguments
    var ftype = $("#ftype").val();
    var myfile = $("#fileaddr").val();
    var ftype2 = $("#ftype2").val();
    var myfile2 = $("#fileaddr2").val();
    
    if(!myfile){
      alert("No Traffic data file entered.");
      return;
    }
	     if(!myfile2){
      alert("No Weather data file entered.");
      return;
    }
    
    readFile(ftype, myfile);        
  });
});
