// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .





  	function add() {

		var no = $("#pic p").length
		$('#pic').append('<p id="'+no+'"><label for="album_pics_attributes_' + no + '_name">Name</label><input name="album[pics_attributes]['+no+'][name]" id="album_pics_attributes_' + no + '_name" type="text"><input name="album[pics_attributes]['+ no + '][avatar]" id="album_pics_attributes_' + no + '_avatar" type="file"><label for="album_pics_attributes_'+no+'_tags_attributes_0_tag_name">Tag name</label> <input name="album[pics_attributes]'+no+'[tags_attributes][0][name]" id="album_pics_attributes_'+no+'_tags_attributes_0_name" type="text"> </p>')   
	}	

	function remov() {
		$('#pic p:last').remove();
	}

$(document).on('change', '.btn-file :file', function() {
  var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        
        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }
        
    });
});