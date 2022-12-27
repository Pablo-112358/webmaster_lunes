var express = require("express");
var router = express.Router();
var nodemailer = require("nodemailer");
var contactoModel = require('../models/contactoModel');

/* GET home page. */

router.get("/", function (req, res, next) {
  res.render("contacto", { isContacto: true });
});

router.post("/", async (req, res, next) => {
  

  var nombre = req.body.nombre;
  var email = req.body.email;
  var tel = req.body.tel;
  var mensaje = req.body.mensaje;
  

  var obj = {
    to: "pabloromano087@gmail.com",
    subject: "contacto desde la web",
    html:
      nombre +
      " se ha contactado a travez de Transportes X y quere mas información a este correo: " +
      email +
      ".<br> Además, hizo este comentaario: " +
      mensaje +
      ",<br> su tel es: " +
      tel,
  };
  
  var Transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS,
    },
  });
  var info = await Transport.sendMail(obj);
  var contacto = await contactoModel.insertContacto(req.body);

  res.render("contacto", {
    isContacto:true,
    message: "Mensaje enviado correctamente" });
    // console.log(req.body);
    // console.log("pablo");
});

module.exports = router;
