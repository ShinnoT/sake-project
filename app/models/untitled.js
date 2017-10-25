items = [];
document.querySelectorAll('.searchresultitems .dui-card').forEach(item => {
  const data = {};
  data.img = $(item).find('img').attr('src');
  data.title = $(item).find('.title a').html();
  if (data.img && data.title) {
    items.push(data);
  }
});
