# 🎓 Cursos Online

Aplicativo mobile desenvolvido em **Flutter**, com um backend em **Flask + MySQL** containerizado via **Docker Compose**.  
O projeto foi criado para a disciplina de **Desenvolvimento Mobile**, com foco em integração entre front-end e back-end e uso de banco de dados relacional.

---

## 🚀 Tecnologias Utilizadas

- 🧩 **Flutter** — desenvolvimento da interface e lógica do app  
- 🐍 **Flask (Python)** — criação das APIs REST  
- 🐬 **MySQL** — banco de dados relacional  
- 🐳 **Docker Compose** — orquestração dos containers  
- 🌐 **HTTP** — integração entre o app e o backend  

---

## 📱 Funcionalidades

- Exibição de uma lista de cursos com imagens, descrições e informações sobre cada um.  
- Sistema de curtidas e comentários.  
- Comunicação em tempo real com o backend Flask.  
- Armazenamento e recuperação de dados pelo banco MySQL.  
- Interface intuitiva, responsiva e moderna, com Material Design.  

---

## ⚙️ Estrutura do Projeto

```plaintext
trabalho-flutter/
├── front-end-cursos/        # Projeto Flutter
│   └── lib/
│       ├── telas/           # Telas principais
│       ├── componentes/     # Widgets reutilizáveis
│       └── apis/            # Comunicação com o backend
│
└── servicos/                # Backend Flask
    ├── cursos/              # API de cursos
    ├── comentarios/         # API de comentários
    ├── likes/               # API de curtidas
    ├── imagens/             # Armazenamento de imagens
    ├── dockerfiles/         # Configurações Docker
    ├── banco.sql            # Script do banco de dados
    └── docker-compose.yml   # Orquestração dos containers
```
---

## 🧠 Conceitos Envolvidos
Integração entre front-end mobile e APIs RESTful.
Uso de containers para modularizar serviços.
Comunicação entre múltiplos containers via rede Docker.
Persistência de dados em MySQL.

## 💻 Como Executar o Projeto
1️⃣ Clonar o repositório
```bash
git clone https://github.com/seuusuario/cursos-online.git
cd cursos-online
```

2️⃣ Subir o backend com Docker
```bash
cd servicos
docker-compose up --build
```

3️⃣ Executar o app Flutter
```bash
cd ../front-end-cursos
flutter pub get
flutter run
```

## 🌟 Diferenciais
Separação entre front e back-end.
Uso de múltiplos serviços Flask independentes (cursos, comentários e likes).
Backend containerizado com Docker Compose.
Interface moderna e fluida feita com Flutter.

## 🔮 Possíveis Melhorias Futuras
Autenticação de usuários e perfis.
Tela de login e favoritos.
Painel administrativo para cadastrar novos cursos.
Migração do banco para PostgreSQL ou integração em nuvem.

