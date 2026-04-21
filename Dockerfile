# build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY DuckPortfolio.BibleApi.csproj ./
RUN dotnet restore DuckPortfolio.BibleApi.csproj
COPY . ./
RUN dotnet publish DuckPortfolio.BibleApi.csproj -c Release -o /app/publish

# run
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet","DuckPortfolio.BibleApi.dll"]
