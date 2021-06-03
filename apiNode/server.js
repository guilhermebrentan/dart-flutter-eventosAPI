var express = require('express');
var app = express();
var cors = require('cors');
var bodyParser = require('body-parser');
var js2xmlparser = require("js2xmlparser");

//////////////////////////////////////////////BANCO DE DADOS//////////////////////////////////////////////

var eventos = [];
var funcionarios = [
    {
        id: 1,
        nome: "Guilherme Brentan",
        apelido: "Guido",
        departamento: "Desenvolvimento de Sistemas",
        foto: "https://i.pinimg.com/originals/b5/dc/a9/b5dca9fac1361023498d6cb66e4d8b13.jpg"
    },
    {
        id: 2,
        nome: "Mateus Cleto",
        apelido: "Cleto",
        departamento: "Desenvolvimento de Sistemas",
        foto: "https://cotuca.unicamp.br/cotuca/wp-content/uploads/2021/02/Mateus-Cleto-scaled.jpg"
    },
    {
        id: 3,
        nome: "Henrique Afonso",
        apelido: "Fonso",
        departamento: "Artes Visuais",
        foto: "https://upload.wikimedia.org/wikipedia/pt/a/ae/Henrique_Afonso_da_Silva_Horta.jpg"
    },
    {
        id: 4,
        nome: "Muricy Ramalho",
        apelido: "Professor",
        departamento: "Análise de Resultados",
        foto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW63MBji56zODATHPboWWvw8BR95Lf8gP1Rg&usqp=CAU"
    },
    {
        id: 5,
        nome: "Gabriel Barbosa",
        apelido: "Gabigol",
        departamento: "Marketing",
        foto: "https://static-wp-tor15-prd.torcedores.com/wp-content/uploads/2019/11/gabigol-do-flamengo.jpg"
    },
    {
        id: 6,
        nome: "Hernan Crespo",
        apelido: "Crespo",
        departamento: "Recursos Humanos",
        foto: "https://pbs.twimg.com/profile_images/1360306422848888835/_GVLIvVV_400x400.jpg"
    }

];
var locais = [
    { 
        id: 1, 
        nome: "Sala do Café",
        foto: "https://imagens-revista.vivadecora.com.br/uploads/2018/06/cantinho-do-caf%C3%A9-na-sala-de-jantar-Foto-Decorando-Tudo.jpg"
    },
    { 
        id: 2, 
        nome: "Refeitório",
        foto: "https://blog.controlle.com/wp-content/uploads/2014/04/Refeit%C3%B3rio-GSK.jpg"
    },
    { 
        id: 3, 
        nome: "Sala de Reuniões",
        foto: "https://blog.marelli.com.br/wp-content/uploads/2017/10/sala-de-reunioes.png"
    },
    { 
        id: 4, 
        nome: "Escritório Central",
        foto: "https://www.officelab.com.br/wp-content/uploads/2019/12/solucoes-em-mobiliario-de-escritorio-conheca-as-vantagens-da-officelab.jpg"
    }
];

var tiposDeEvento = [
    { id: 1,  nome: "Reunião" },
    { id: 2,  nome: "Mini Curso" },
    { id: 3,  nome: "Palestra" },
    { id: 4,  nome: "Apresentação" },
    { id: 5,  nome: "Brainstorming" },
    { id: 6,  nome: "Etapas do Scrum: Backlog do produto" },
    { id: 7,  nome: "Etapas do Scrum: Sprint Backlog" },
    { id: 8,  nome: "Etapas do Scrum: Daily Meeting" },
    { id: 9,  nome: "Etapas do Scrum: Sprint Review" },
    { id: 10, nome: "Etapas do Scrum: Print Restrospective" }
];

//////////////////////////////////////////////ROTAS E MÉTODOS//////////////////////////////////////////////

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.get('/eventos', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, eventos);
});

app.get('/funcionarios', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, funcionarios);
});

app.get('/locais', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, locais);
});

app.get('/tiposDeEvento', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, tiposDeEvento);
});

app.post('/eventos/:id/:participantes/:dia/:horario/:local/:idTipo', (req, res) => {
    var idEvento      = req.params.id;
    var participantes = req.params.participantes;
    var dia           = req.params.dia;
    var horario       = req.params.horario;
    var local         = req.params.local;
    var idTipo        = req.params.idTipo;

    eventos.push({ 
        idEvento     : idEvento, 
        participantes: participantes, 
        dia          : dia, 
        horario      : horario, 
        local        : local,
        idTipo       : idTipo 
    });
    console.log("Evento marcado");
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, "deu certo");
});


app.delete('/eventos/:id?', (req, res) => {
    var id = req.params.id;
    var indice = eventos.findIndex(item => item.idEvento == id);
    eventos[indice] = null;
    var novoVetor = [];
    for (var i = 0; i < eventos.length; i++) {
        if (eventos[i] != null) {
            novoVetor.push(eventos[i]);
        }
    }
    eventos = novoVetor;
    console.log("Evento deletado")
    res.header('Access-Control-Allow-Origin', '*')
        .send(200, "evento excluido");
});

app.listen(process.env.PORT || 3000);
console.log('A API está no ar');