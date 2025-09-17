# cheatpt

**CheatPT** é um script em Bash que consulta [cheat.sh](https://cheat.sh/) e traduz automaticamente para português, tornando mais fácil entender comandos Linux.  
O script também adiciona explicações resumidas para comandos populares e, na versão `cheatpt_final_save.sh`, salva automaticamente a saída em arquivos `.txt`.

---

## Funcionalidades

- Consulta qualquer comando do Linux no cheat.sh
- Tradução completa da saída para português
- Limpeza de códigos de cor ANSI para exibição correta no terminal
- Explicações resumidas para comandos comuns (`ls`, `rm`, `cd`, `mkdir`, `touch`, `cp`, `mv`)
- Opção de salvar a saída traduzida em arquivo para consulta futura

---

## Dependências

Para que o script funcione corretamente, é necessário ter:

1. **curl** - para buscar cheatsheets no cheat.sh  
2. **translate-shell (`trans`)** - para traduzir a saída para português  

### Instalação das dependências

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install curl translate-shell

**Executar um comando:**
./cheatpt_final.sh ls
./cheatpt_final.sh rm
