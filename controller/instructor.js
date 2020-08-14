var express 	= require('express');
var userModel 	= require.main.require('./models/user');
var instructormodel = require.main.require('./models/instructormodel');
var coursesmodel = require.main.require('./models/coursesmodel');

var router 		= express.Router();

router.get('*', function(req, res, next){
  if(req.session.username == null){
		res.redirect('/login');
	}else{
		next();
	}
 });

router.get('/', function(req, res){
  res.render('instructor/index',{uname : req.session.username});
});

router.get('/classes', function(req, res){
  coursesmodel.getAll(function(results){
    res.render('instructor/classes', {courselist : results, uname : req.session.username});
  });
});

router.get('/grades', function(req, res){
  coursesmodel.getAll(function(results){
    res.render('instructor/grades', {courselist : results, uname : req.session.username});
  });
});

router.post('/grades', function(req, res){
  res.redirect("/instructor/coursegrades/"+ req.body.button);
});

router.get('/coursegrades/:id', function(req, res){
  res.render("instructor/coursegrades",{uname : req.session.username});
});


router.get('/profilesettings', function(req, res){
  res.render('instructor/profilesettings',{uname : req.session.username});
});

router.get('/security', function(req, res){
  res.render('instructor/security',{uname : req.session.username});
});

router.get('/myaccount', function(req, res){
  res.render('instructor/myaccount',{uname : req.session.username});
});

router.get('/myinbox', function(req, res){
  res.render('instructor/myinbox',{uname : req.session.username});
});

router.get('/coursefile', function(req, res){
  res.render('instructor/coursefile',{uname : req.session.username});
});

router.get('/studentlist', function(req, res){
  res.render('instructor/studentlist',{uname : req.session.username});
});

router.post('/coursefile', function(req, res){
  if(req.files){
		var file = req.files.files;
		var filename = file.name;
		console.log(filename);
		file.mv('../EduBee/Assets/Upload/'+filename, function(err){
			if(err){
				res.send(err);
		}else{
				console.log("File Uploaded");
				res.render('instructor/coursefile');
		}
		})
	}
});



module.exports = router;
