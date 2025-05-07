# AutimitOS

Este é o **MVP** de um sistema backend escrito em **Zig**, usando o microframework **Zap** (HTTP) e o driver nativo **zpg** (PostgreSQL).  
O objetivo é fornecer uma API simples para registrar **entrada** e **saída** de veículos em concessionárias, permitindo:

- Gravar modelo e placa do veículo
- Marcar timestamp de entrada e saída
- Validar duplicidade de placa
- Retornar status de sucesso ou erro

---

### Tecnologias

- **Linguagem**: Zig 0.11+
- **Framework HTTP**: [Zap](https://github.com/zigzap/zap)
- **Driver PostgreSQL**: [zpg](https://github.com/thienpow/zpg)
- **Banco de dados**: PostgreSQL 13+

---

### Funcionalidades do MVP

| Método | Endpoint             | Payload JSON                           | Descrição                             |
| ------ | -------------------- | -------------------------------------- | ------------------------------------- |
| POST   | `/vehicles/entry`    | `{ "model": "Fiesta", "plate": "ABC1D23" }` | Registra hora de entrada do veículo   |
| POST   | `/vehicles/exit`     | `{ "plate": "ABC1D23" }`               | Registra hora de saída do veículo     |
| GET    | `/vehicles/:plate`   | —                                      | Consulta status (entry/exit) do carro |

---

### Variáveis de ambiente

```bash
# URL de conexão com Postgres
export DB_URL="postgres://user:pass@localhost:5432/autimit_db"

# Porta para o servidor HTTP
export PORT=3000
