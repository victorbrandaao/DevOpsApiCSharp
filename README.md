# DevOpsApiCSharp

Projeto iniciante para aprender práticas básicas de DevOps com uma API em .NET 9.

Este repositório contém uma API ASP.NET (`DevOpsApi`) e testes unitários. O objetivo é experimentar builds, publish e empacotamento em imagem Docker.

## Estrutura

- `DevOpsApi/` — código fonte da API ASP.NET
- `DevOpsApi.Tests/` — testes unitários
- `Dockerfile` — Dockerfile na raiz (otimizado para multi-stage)
- `DevOpsApi/Dockerfile` — cópia alternativa do Dockerfile dentro do diretório do projeto (compatibilidade com CI)

## Pré-requisitos

- .NET 9 SDK instalado
- (Opcional) Docker para construir/rodar imagens

## Como compilar localmente

Na raiz do repositório:

```bash
dotnet build DevOpsApi/DevOpsApi.csproj -c Release
```

Para publicar (gera os artefatos):

```bash
dotnet publish DevOpsApi/DevOpsApi.csproj -c Release -o ./out
```

## Como construir a imagem Docker

Você pode usar o `Dockerfile` na raiz ou o que está em `DevOpsApi/`.

Usando o Dockerfile dentro de `DevOpsApi` como contexto:

```bash
docker build -t devopsapi:latest -f DevOpsApi/Dockerfile DevOpsApi
```

Ou usando o Dockerfile da raiz (construindo a partir da raiz):

```bash
docker build -t devopsapi:latest -f Dockerfile .
```

## Como rodar o container

```bash
docker run --rm -p 8080:80 devopsapi:latest
```

Depois, abra `http://localhost:8080` ou use `curl` para testar.

## Notas

- Este é um projeto de aprendizado. O Dockerfile foi ajustado para melhor cache de dependências e para facilitar o uso em pipelines de CI.
- Se o seu pipeline reclamar que não encontra o `Dockerfile`, verifique o diretório de contexto (`context`) e/ou indique explicitamente o arquivo com `-f`.

## Contato

Este repositório é parte do aprendizado em DevOps — mudanças e melhorias são bem-vindas.
