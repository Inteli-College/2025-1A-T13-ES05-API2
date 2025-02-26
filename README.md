# Usamos o projeto dentro de school-api-gps

# Documentação da API

## Dados disponiveis

- **Institution (Instituição de ensino): 305**
- **Student (Estudantes): 2000**
- **Course (Cursos): 100**
- **Enrollments (Matrículas): 4037**

obs: Cada estudante tem entre 1-3 matrículas

## URL Base
Todos os endpoints estão prefixados com:
```
https://two025-1a-t13-es05-api2.onrender.com/api/v1
```

## Autenticação
Esta API utiliza autenticação via Bearer Token. Inclua o seguinte header em todas as requisições:
```
Authorization: Bearer seu_token
```
Substitua `seu_token` por um dos tokens válidos previamente gerados.

## Endpoints

### 1. Instituições

#### Listar Todas as Instituições
**Endpoint:**
```
GET /api/v1/institutions
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/institutions
```

**Descrição:**
Retorna uma lista com todas as instituições cadastradas.

---

#### Detalhes de uma Instituição
**Endpoint:**
```
GET /api/v1/institutions/:id
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/institutions/1
```

**Descrição:**
Retorna informações detalhadas de uma instituição específica.

---

#### Listar Alunos de uma Instituição
**Endpoint:**
```
GET /api/v1/institutions/:id/students
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/institutions/1/students
```

**Descrição:**
Retorna todos os alunos matriculados na instituição especificada.

---

### 2. Alunos

#### Visualizar Detalhes de um Aluno
**Endpoint:**
```
GET /api/v1/students/:id
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/students/1
```

**Descrição:**
Retorna informações detalhadas de um único aluno.

---

#### Listar Matrículas de um Aluno
**Endpoint:**
```
GET /api/v1/students/:id/enrollments
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/students/1/enrollments
```

**Descrição:**
Retorna todas as matrículas vinculadas ao aluno especificado, incluindo detalhes sobre a instituição e o curso.

---

### 3. Cursos

#### Listar Todos os Cursos
**Endpoint:**
```
GET /api/v1/courses
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/courses
```

**Descrição:**
Retorna uma lista com todos os cursos disponíveis.

---

#### Detalhes de um Curso
**Endpoint:**
```
GET /api/v1/courses/:id
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/courses/1
```

**Descrição:**
Retorna informações detalhadas de um curso específico.

---

#### Listar Alunos de um Curso
**Endpoint:**
```
GET /api/v1/courses/:id/students
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/courses/1/students
```

**Descrição:**
Retorna todos os alunos matriculados no curso especificado.

---

### 4. Estatísticas

#### Obter Estatísticas da API
**Endpoint:**
```
GET /api/v1/stats
```

**Exemplo de Requisição:**
```bash
curl -H "Accept: application/json" \
     -H "Authorization: Bearer seu_token" \
     https://two025-1a-t13-es05-api2.onrender.com/api/v1/stats
```

**Descrição:**
Retorna estatísticas resumidas da API, tais como:
- Total de alunos
- Total de matrículas
- Total de cursos
- Número de matrículas por instituição

---

## Notas Adicionais
- **Formato de Resposta:** Todas as respostas são retornadas em formato JSON.
- **API Somente de Leitura:** Esta API é destinada exclusivamente à consulta de dados. Não há criação, atualização ou deleção de registros.
- **Tratamento de Erros:** São utilizados os códigos de status HTTP padrão (por exemplo, 200 OK, 401 Unauthorized, 404 Not Found).

---
