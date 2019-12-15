using GR_WebApi.Authentication;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Swagger;

namespace GR_WebApi
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors();
            services.AddMvc(options => options.EnableEndpointRouting = false).SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            services.AddSwaggerGen(
                a => a.SwaggerDoc("v1", new Info { Title = "Swagger Global Repository", Description = "Swagger WebAPI Global Repository" }));
            services.AddAuthentication("BasicAuthentication")
                .AddScheme<AuthenticationSchemeOptions, ApiAuthenticationHandler>("BasicAuthentication", null);
            
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
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
                    //a.InjectJavascript(, "SwashbuckleCustomAuth.CustomContent.basic-auth.js");
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
