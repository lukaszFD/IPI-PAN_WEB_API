using DB_ModelEFCore.Controllers.Repository;
using DB_ModelEFCore.Controllers.Repository.Class;
using GR_WebApi.Authentication;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using Swashbuckle.AspNetCore.Swagger;

namespace GR_WebApi
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors();
            services.AddMvc(options => options.EnableEndpointRouting = false).SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            services.AddSwaggerGen(a =>
            {
                a.SwaggerDoc("v1", new Info { Title = "Swagger Global Repository", Description = "Swagger WebAPI Global Repository" });
                a.AddSecurityDefinition("Basic", new BasicAuthScheme { Description = "Basic authentication" });
                a.DocumentFilter<BasicAuthFilter>();
            });
            services.AddScoped<IUserService, GlobalRepositoryData>();
            services.AddAuthentication("BasicAuthentication")
                .AddScheme<AuthenticationSchemeOptions, ApiAuthenticationHandler>("BasicAuthentication", null);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseSwagger();
            app.UseSwaggerUI(
                a =>
                {
                    a.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger Global Repository");
                }
                );
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());
            app.UseAuthentication();
            app.UseMvc();
        }
    }
}
