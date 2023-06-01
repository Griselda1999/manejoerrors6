// ********* Metodos HTTP TABLA MATERIA ***********

//**************** Metodo Get *********************

const mysql = require ('mysql')
const express= require ('express')
const materia = express.Router()
var connection = mysql.createConnection({

  host     : 'localhost',
  user     : 'griselda',
  password : 'G19990311yns',
  database : 'bd_registroalumno'

  
});

 
connection.connect();

materia.get('/api/materia', (req, res) =>{
    connection.query('SELECT * FROM tbl_materia;', function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  })
  
  //*************** Metodo Get ID *****************
  
  materia.get('/api/materia/:id', (req, res) =>{
    const {id} = req.params;
    connection.query('SELECT * FROM tbl_materia WHERE id = ?', [id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows[0])
    });  
  })
  
  //*************** Metodo POST *****************
  
  materia.post('/api/materia', (req, res) =>{
    const {nombre,descripcion} = req.body;
  
    let respuestaErrorMateria=[]
   if(!nombre){
  
    respuestaErrorMateria.push("El nombre de la materia no debe estar vacia")
   }
   if(!descripcion){
    respuestaErrorMateria.push("La descripcion de la materia no debe estar vacia")
   }
   
  
   if(respuestaErrorMateria.length > 0){
  
    res.status(400).json({codigo: 400, mensaje: respuestaErrorMateria})
      return
   }
  
    connection.query('Insert into tbl_materia (nombre ,descripcion) Values (?, ?);', [nombre, descripcion] , function(err, rows, fields) {
      if(err){
        console.error(err)
        let respuestaError ={}
        if(err.code === 'ER_BAD_NULL_ERROR'){
          respuestaError= {codigo: 500, mesaje: "Los campos no pueden ser nulos"}
        }
  
        res.status(500).json(respuestaError)
      }else{
        res.status(200).json(rows)
      }
      
    });  
  })
  
  //*************** Metodo PUT *****************
  
  materia.put('/api/materia/:id', (req, res) =>{
    const {id} = req.params;
    const {nombre,descripcion} = req.body;
    
  
    connection.query('Update tbl_materia SET nombre = ?, descripcion = ? WHERE id = ?', [nombre, descripcion, id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
  
  
  
    });  
  })
  
  //*************** Metodo DELETE *****************
  
  
  materia.delete('/api/materia/:id', (req, res) =>{
    const {id} = req.params;

  
   
  
    connection.query('Delete from tbl_materia WHERE id = ?', [id] , function(err, rows, fields) {
      if (err) throw err;
      res.status(200).json(rows)
    });  
  
  
   
  })

  module.exports= materia
  