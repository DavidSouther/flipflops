var fs = require('graceful-fs');
var mkdirp = require('mkdirp');

// CONFIG:
var ghostExport = 'ghost-export.json';
var oneAuthor = 'Your Name';

var postsArr;
var fullData = fs.readFileSync(ghostExport, 'utf8');

fullData = JSON.parse(fullData)
postsArr = fullData.data.posts;

postsArr.some(function(e) {
  var postDateFull = new Date(e.published_at);
  var postISODate = postDateFull.toISOString();
  var postYear = postDateFull.getFullYear();
  var postMonth = postDateFull.getMonth() + 1;
  var postDate = postDateFull.getDate();
  var slug = e.slug;
  var path = './posts/' + postYear + '/' + postMonth + '/' + postDate + '/' + slug + '/';
  var pathToFile = path + 'index.md';
  var title = e.title;
  var author = (e.author_id === 1) ? oneAuthor : 'Unknown Author';
  var catArr = ['Need-to-figure-out-categories-still', 'DummyCat'];
  var mdBody = e.markdown;
  var front, post;

  mkdirp.sync(path);

  front = '---\n';
  front += 'title: ' + title + '\n';
  front += 'date: ' + postISODate + '\n';
  front += 'author: ' + author + '\n';
  front += 'categories:\n';
  catArr.forEach(function(cat) {
    front += '  - ' + cat + '\n';
  });
  front += '\n---\n\n';

  post = front + mdBody;

  fs.writeFileSync(pathToFile, post);
});
