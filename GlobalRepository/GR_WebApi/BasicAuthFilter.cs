using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Collections.Generic;

namespace GR_WebApi
{
    public class BasicAuthFilter : IDocumentFilter
    {
        public void Apply(SwaggerDocument swaggerDoc, DocumentFilterContext context)
        {
            var securityRequirements = new Dictionary<string, IEnumerable<string>>()
        {
            { "Basic", new string[] { } }
        };

            swaggerDoc.Security = new[] { securityRequirements };
        }
    }
}
