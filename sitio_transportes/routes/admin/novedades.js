var express = require("express");
const pool = require("../../models/bd");
var router = express.Router();
// var usuarioModel = require('./../../models/usuarioModel')
var novedadesModel = require("../../models/novedadesModel");

// listado de Novedades
router.get("/", async function (req, res, next) {
  // var novedades = await novedadesModel.getNovedades();

  var novedades
  if (req.query.q === undefined){
    novedades = await novedadesModel.getNovedades();
  }else{
    novedades = await novedadesModel.buscarNovedades(req.query.q);
  }
  
  
  res.render("admin/novedades", {
    layout: "admin/layout",
    usuario: req.session.nombre,
    novedades,
    is_search: req.query.q !==undefined,
    q: req.query.q
  });
});

//eliminar las novedades

router.get("/eliminar/:id", async (req, res, next) => {
  var id = req.params.id;
  await novedadesModel.deleteNovedadById(id);
  res.redirect("/admin/novedades");
});

// formulario de agregar una novedad
router.get("/agregar", (req, res, next) => {
  res.render("admin/agregar", {
    layout: "admin/layout",
  }); // cierra render
}); // cierra get

// intertar la Novedad

router.post("/agregar", async (req, res, next) => {
  try {
    if (
      req.body.titulo != "" &&
      req.body.subtitulo != "" &&
      req.body.cuerpo != ""
    ) {
      await novedadesModel.insertNovedad(req.body);
      res.redirect("/admin/novedades");
    } else {
      res.render("admin/agregar", {
        layout: "admin/layout",
        error: true,
        message: "Todos los campos son requeridos",
      });
    }
  } catch (error) {
    console.log(error);
    res.render("admin/agregar", {
      layout: "admin/layout",
      error: true,
      message: "No se cargo la Novedad",
    });
  }
});

//Abrir formulario de modificación
router.get("/modificar/:id", async (req, res, next) => {
  var id = req.params.id;
  
  console.log(req.params.id);
  var novedad = await novedadesModel.getNovedadById(id);

  console.log(req.params.id);
  res.render("admin/modificar", {
    layout: "admin/layout",
    novedad
  }); // cierra render
}); // cierra get

// modificacion de datos

router.post("/modificar", async (req, res, next) => {
  try {
       console.log(req.body);
    var obj = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      cuerpo: req.body.cuerpo
    }
    console.log(obj);

    await novedadesModel.modificarNovedadById(obj, req.body.id);
    res.redirect("/admin/novedades");

  } catch (error) {
    console.log(error);
    res.render("admin/modificar", {
      layout: "admin/layout",
      error: true,
      message: "No se modificó la Novedad",
    });
  }
});

module.exports = router;
