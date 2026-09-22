# korefs.github.io

Página pessoal de Gabriel (@korefs). Landing page estática, responsiva e de tela única, feita com HTML e CSS.

## Desenvolvimento

Execute `python3 -m http.server 4173` na raiz e abra http://localhost:4173.

O conteúdo está em `index.html`; os estilos e o favicon, em `assets/`.
Apresentação e projetos baseados no [perfil público do GitHub](https://github.com/korefs).

## Publicação

O workflow `.github/workflows/pages-deploy.yml` publica no GitHub Pages a cada push em `main` ou `master`. Nas configurações do repositório, use **GitHub Actions** como fonte de publicação.

Sem JavaScript, Ruby, Jekyll ou compilação. A fonte Instrument Serif é carregada pelo Google Fonts, com fallback local.

O layout cabe na tela em dispositivos comuns. Em alturas excepcionalmente pequenas ou com ampliação de texto, a rolagem permanece disponível para preservar o acesso ao conteúdo.
