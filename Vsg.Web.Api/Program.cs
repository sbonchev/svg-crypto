using Vsg.Services;
using Microsoft.EntityFrameworkCore;
using Vsg.Console;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers()
    .AddXmlSerializerFormatters();

builder.Services.AddDbContext<CryptoDbContextService>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"),
        sqlOptions => sqlOptions.CommandTimeout(300)));

builder.Services.AddMemoryCache();

builder.Services.AddScoped<ICryptoService, CryptoService>();
builder.Services.AddScoped(typeof(IRepositoryService<>), typeof(RepositoryService<>));

builder.Services.AddHostedService<CryptoClientService>();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();