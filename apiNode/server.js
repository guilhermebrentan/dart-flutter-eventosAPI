const express = require('express'); //declarando o módulo express
const app = express(); //instanciando ele
const bodyParser = require('body-parser'); 
const port = 3000; //porta padrão
const sql = require('mssql');
const connStr = "Server=regulus.cotuca.unicamp.br;Database=BD19175;User Id=bd19175;Password=guidomotoca45;"

sql.connect(connStr) //abrindo conexão com o servidor sql
.then(conn => global.conn = conn) //se der certo okay
.catch(err => console.log(err)); // se não comunica o erro

app.use(bodyParser.urlencoded({ extended: true })); 
app.use(bodyParser.json());

const router = express.Router();

router.get('/',  (req,  res)  =>  res.json({  "mensagem":"A  API  está  ativa!"  }));
app.use('/', router);

app.listen(port);
console.log('O servidor está ativo!');

//rotas

router.get('/funcionarios', (req, resposta) => { 
    var pesquisa = "select * from empFuncionarios";

    global.conn.query(pesquisa, (req, res) => {
        console.log(res);   
    });
}); 