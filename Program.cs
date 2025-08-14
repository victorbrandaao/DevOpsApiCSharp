var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Lista de tarefas (em memória)
var tasks = new List<string>();

app.MapGet("/", () => "API DevOps em C#!");
app.MapGet("/tasks", () => tasks);
app.MapPost("/tasks", (string task) =>
{
    tasks.Add(task);
    return Results.Ok(new { message = "Tarefa adicionada com sucesso!" });
});

app.Run();
