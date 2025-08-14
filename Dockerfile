# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia apenas o projeto e restaura
COPY ./DevOpsApi/DevOpsApi.csproj ./DevOpsApi/
RUN dotnet restore ./DevOpsApi/DevOpsApi.csproj

# Copia o restante do código
COPY ./DevOpsApi/. ./DevOpsApi/
RUN dotnet publish ./DevOpsApi/DevOpsApi.csproj -c Release -o /app

# Etapa 2: imagem final
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "DevOpsApi.dll"]
