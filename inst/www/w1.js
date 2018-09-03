$(document).ready(function(){
  
  function readFile(ftype, myfile){
    //disable the button during upload
    $("#submitbutton").attr("disabled", "disabled");        

	$("#functR").text("readFile");
    
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
      //on success call removeColumns()
      removeColumns(session);
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
  
  function removeColumns(mydata){
	$("#functR").text("removeColumns");
	

	//perform the request
    var req = ocpu.call("removeColumn", {
      dataFile : mydata,
	  ... : ["Weight__tonnes_","Weight__tonnes_","Flags","Flag_Text","Num_Axles","Axle_Weights__tonnes____","Axle_Spacings__m____"]
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("removeColumn");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
 	//on success call removeColumns()
     	 enrichTimestamp(session);
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
	  toColumn: "Time",
	  startDate: $("#startDate").val()
    }, function(session){

			mysession = session;

		$("#functR").text("");
		$("#functC").text("enrichTime");
        $("#key").text(mysession.getKey());
        $("#location").text(mysession.getLoc());
		
    }).fail(function(){
      alert("Server error: " + req.responseText);
    });        
  }
  
  $("#submitbutton").on("click", function(){
    
    //arguments
    var ftype = $("#ftype").val();
    var myfile = $("#fileaddr").val();
    
    if(!myfile){
      alert("No file selected.");
      return;
    }
    
    readFile(ftype, myfile);        
  });
});
