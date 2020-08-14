var express 	= require('express');
var postModel 	= require.main.require('./models/post');
var router 		= express.Router();

router.get('*', function(req, res, next){
	if(req.session.username == null){
		res.redirect('/login');
	}else{
		next();
	}
});

router.get('/post', function(req, res){
  postModel.getAll(function(results){
  res.render('forum',{postlist : results, uname : req.session.uname})
    });
});

router.post('/announcements', function(req, res){
  postModel.getAllAnnouncements(function(results){
  res.render('Home/index',{announcementtlist : results, uname : req.session.uname})
    });
});

router.post('/post', function(req, res){

  var datetime = new Date();
  //var time = "at "+datetime.toISOString().slice(11,19)+" in "+datetime.toISOString().slice(0,10);

  var post = {
    title 		: req.body.title,
    details	: req.body.details,
    id: req.session.id,
    name: req.session.username,
    time: datetime
  }

  postModel.insert(post, function(status){
    if(status){
      res.redirect('/forum/post');
    }else{
      res.redirect('/login');
    }
  });


});


module.exports = router;
