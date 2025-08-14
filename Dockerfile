# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia apenas o projeto e restaura (melhora cache de camadas)
COPY DevOpsApi.csproj ./
RUN dotnet restore DevOpsApi.csproj

# Copia o restante do código e publica (usa --no-restore porque já restauramos)
COPY . ./
RUN dotnet publish DevOpsApi.csproj -c Release -o /app --no-restore

# Etapa 2: imagem final (runtime)
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Variáveis recomendadas para apps ASP.NET em containers
ENV ASPNETCORE_URLS=http://+:80 \
    DOTNET_RUNNING_IN_CONTAINER=true
EXPOSE 80

COPY --from=build /app .
ENTRYPOINT ["dotnet", "DevOpsApi.dll"]
