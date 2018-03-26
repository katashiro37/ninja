document.addEventListener("turbolinks:load", function() {

      $("#tasks").sortable({
	    update: function(e, ui) {
	      Rails.ajax({
	        url: $(this).data("update-url"),
	        type: "POST",
	        data: $(this).sortable('serialize'),
	      });
	    }
	  });
});