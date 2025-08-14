# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia o arquivo de projeto e restaura dependências
COPY DevOpsApi/*.csproj ./DevOpsApi/
RUN dotnet restore DevOpsApi/DevOpsApi.csproj

# Copia todo o código e publica a aplicação
COPY DevOpsApi/. ./DevOpsApi/
RUN dotnet publish DevOpsApi/DevOpsApi.csproj -c Release -o /app

# Etapa 2: Imagem final para rodar a API
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "DevOpsApi.dll"]
