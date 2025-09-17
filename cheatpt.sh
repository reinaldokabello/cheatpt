#!/bin/bash
# cheatpt_final.sh - Consulta cheat.sh 
# Linux system Command 

# Verifica se curl está instalado
if ! command -v curl &>/dev/null; then
    echo "Erro: instale o curl."
    exit 1
fi

# Verifica se translate-shell (trans) está instalado
if ! command -v trans &>/dev/null; then
    echo "Erro: instale o translate-shell (trans) para tradução automática."
    exit 1
fi

# Verifica se usuário passou um comando
if [ -z "$1" ]; then
    echo "Uso: $0 <comando>"
    exit 1
fi

comando="$1"

echo ""
echo "==============================="
echo "Pesquisando '$comando'"
echo "(By -  Art-Zenun)"
echo "==============================="
echo ""

# Busca no cheat.sh (em inglês) e remove cores ANSI
saida=$(curl -s "https://cheat.sh/${comando}" | sed -r "s/\x1B\[[0-9;]*[mK]//g")

# Traduz todo o conteúdo para português
saida_pt=$(echo "$saida" | trans -b :pt)

# Mostra a saída traduzida
echo "$saida_pt"

# Explicações resumidas para comandos populares
case "$comando" in
    ls)
        echo ""
        echo "Explicação rápida do 'ls':"
        echo "- ls : lista arquivos e pastas no diretório atual"
        echo "- ls -1 : lista arquivos um por linha"
        echo "- ls -a : inclui arquivos ocultos"
        echo "- ls -F : adiciona '/' a diretórios"
        echo "- ls -la : lista detalhada com permissões, dono, tamanho e data"
        echo "- ls -lh : lista detalhada com tamanho legível (KB, MB, GB)"
        ;;
    rm)
        echo ""
        echo "Explicação rápida do 'rm':"
        echo "- rm <arquivo> : remove arquivos"
        echo "- rm -f <arquivo> : força remoção sem erros se não existir"
        echo "- rm -i <arquivo> : pede confirmação antes de remover"
        echo "- rm -v <arquivo> : mostra cada arquivo removido"
        echo "- rm -r <diretório> : remove diretórios recursivamente"
        echo "- rm -rf <diretório> : remove diretórios e subarquivos sem confirmação"
        ;;
    cd)
        echo ""
        echo "Explicação rápida do 'cd':"
        echo "- cd <pasta> : muda para a pasta especificada"
        echo "- cd .. : sobe um nível na hierarquia"
        echo "- cd ~ : vai para o diretório home do usuário"
        ;;
    mkdir)
        echo ""
        echo "Explicação rápida do 'mkdir':"
        echo "- mkdir <pasta> : cria um diretório"
        echo "- mkdir -p <caminho/pasta> : cria diretórios intermediários se não existirem"
        ;;
    touch)
        echo ""
        echo "Explicação rápida do 'touch':"
        echo "- touch <arquivo> : cria um arquivo vazio ou atualiza a data de modificação"
        ;;
    cp)
        echo ""
        echo "Explicação rápida do 'cp':"
        echo "- cp <origem> <destino> : copia arquivos ou diretórios"
        echo "- cp -r <origem> <destino> : copia diretórios recursivamente"
        echo "- cp -i : pede confirmação antes de sobrescrever"
        ;;
    mv)
        echo ""
        echo "Explicação rápida do 'mv':"
        echo "- mv <origem> <destino> : move ou renomeia arquivos/diretórios"
        echo "- mv -i : pede confirmação antes de sobrescrever"
        ;;
    *)
        echo ""
        echo "Para mais detalhes, consulte: https://cheat.sh/$comando"
        ;;
esac
