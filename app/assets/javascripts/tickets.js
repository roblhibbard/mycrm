jQuery(function() {
  return $('#ticket_computer_corepc').autocomplete({
  	minLength: 3,
  	source: $('#ticket_computer_corepc').data('autocomplete-source')   
});
});