var express 	= require('express');
var userModel 	= require.main.require('./models/user');
var router 		= express.Router();

router.get('*', function(req, res, next){
	if(req.session.username == null){
		res.redirect('/login');
	}else{
		next();
	}
});

router.get('/', function(req, res){
  res.render('student/index');
});

router.get('/mycourse', function(req, res){
  res.render('student/mycourse');
});

router.get('/mygrades', function(req, res){
  res.render('student/mygrades');
});

router.get('/profilesettings', function(req, res){
  res.render('student/profilesettings');
});

router.get('/security', function(req, res){
  res.render('student/security');
});

router.get('/consultation', function(req, res){
  res.render('student/consultation');
});

router.get('/myaccount', function(req, res){
  res.render('student/myaccount');
});

router.get('/myinbox', function(req, res){
  res.render('student/myinbox');
});

router.get('/coursefile', function(req, res){
  res.render('student/coursefile');
});


module.exports = router;
