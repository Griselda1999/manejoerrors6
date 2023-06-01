// ********* Metodos HTTP TABLA DOCENTE ***********

//**************** Metodo Get *********************

const mysql = require ('mysql')
const express= require ('express')
const docente = express.Router()
var connection = mysql.createConnection({

  host     : 'localhost',
  user     : 'griselda',
  password : 'G19990311yns',
  database : 'bd_registroalumno'

  
});

 
connection.connect();

docente.get('/api/docente', (req, res) =>{
    connection.query('SELECT * FROM tbl_docente;', function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  })
  
  //*************** Metodo Get ID *****************
  
  docente.get('/api/docente/:id', (req, res) =>{
    const {id} = req.params;
    connection.query('SELECT * FROM tbl_docente WHERE id = ?', [id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows[0])
    });  
  })
  
  //*************** Metodo POST *****************
  
  docente.post('/api/docente', (req, res) =>{
    const {nombre, apellido, correo} = req.body;

    let respuestaErrorDocente=[]
    if(!nombre){
   
     respuestaErrorMateria.push("El nombre del docente no debe estar vacia")
    }
    if(!apellido){
     respuestaErrorMateria.push("El apellido del docente no debe estar vacia")
    }
    
   
    if(respuestaErrorDocente.length > 0){
   
     res.status(400).json({codigo: 400, mensaje: respuestaErrorDocente})
       return
    }
   
    
    connection.query('Insert into tbl_docente (nombre ,apellido, correo) Values (?, ?,?);', [nombre, apellido, correo] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  })
  
  
  //*************** Metodo PUT *****************
  
  docente.put('/api/docente/:id', (req, res) =>{
    const {id} = req.params;
    const {nombre, apellido, correo} = req.body;
    
    connection.query('Update tbl_docente SET nombre = ?, apellido = ?, correo = ? WHERE id = ?', [nombre, apellido, correo, id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  })
  
  //*************** Metodo DELETE *****************
  
  
  docente.delete('/api/docente/:id', (req, res) =>{
    const {id} = req.params;
    
    connection.query('Delete from tbl_docente WHERE id = ?', [id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  
    
  })

  module.exports= docente
  