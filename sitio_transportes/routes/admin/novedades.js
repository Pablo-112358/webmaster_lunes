var express = require('express');
var router = express.Router();
// var usuarioModel = require('./../../models/usuarioModel')
var novedadesModel = require('../../models/novedadesModel');

// listado de Novedades
router.get('/', async function(req, res, next) {
  var novedades = await novedadesModel.getNovedades();
  res.render('admin/novedades',{
    layout: 'admin/layout',
    usuario: req.session.nombre,
    novedades
  });
});

//eliminar las novedades

 router.get('/eliminar/:id', async(req, res, next)=> {
  var id = req.params.id;
  await novedadesModel.deleteNovedadById(id);
  res.redirect('/admin/novedades');
 });

module.exports = router;