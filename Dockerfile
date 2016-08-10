FROM microsoft/dotnet:latest

COPY . /app

WORKDIR /app

RUN ["dotnet", "restore"]

RUN ["dotnet", "build", "src/Sandbox.Server.WebApi"]

EXPOSE 5000/tcp

WORKDIR /app/src/Sandbox.Server.WebApi

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://0.0.0.0:5000"]