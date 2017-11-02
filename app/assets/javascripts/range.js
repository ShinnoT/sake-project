
var sheet = document.createElement('style');
var $rangeInput = $('.range input');
var prefs = ['webkit-slider-runnable-track', 'moz-range-track', 'ms-track'];

document.body.appendChild(sheet);

var getTrackStyle = function (el) {
  var curVal = el.value,
      val = (curVal - 1) * 16.666666667,
      style = '';
  var $list = $(el).closest('.range').next();

  // Set active label
  $list.find('li').removeClass('active selected');

  var curLabel = $list.find('li:nth-child(' + curVal + ')');

  curLabel.addClass('selected');
  //curLabel.prevAll().addClass('selected');
}

$rangeInput.on('input', function () {
  sheet.textContent = getTrackStyle(this);
});

// Change input value on label click
$('.range-labels li').on('click', function () {
  var index = $(this).index();
  console.log(index);
  $(this).closest('ul').prev().find('input').val(index + 1).trigger('input');
});
