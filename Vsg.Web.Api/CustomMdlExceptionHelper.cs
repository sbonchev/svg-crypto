using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http.Extensions;
using System.Net;

namespace Vsg.Web.Api
{
    /// <summary>
    /// Custom middle-ware exception handler.
    /// </summary>
    public static class CustomMdlExceptionHelper
    {
        /// <summary>
        /// Middle-ware exception handler
        /// </summary>
        /// <param name="app">IApplicationBuilder</param>
        /// <param name="logger">Serilog.ILogger</param>
        public static void ConfigureCustomExceptionHandler(this IApplicationBuilder app, Serilog.ILogger logger)
        {
            app.UseExceptionHandler(appError =>
            {
                appError.Run(async context =>
                {
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    context.Response.ContentType = "application/json";
                    var contextFeature = context.Features.Get<IExceptionHandlerFeature>();
                    if (contextFeature != null)
                    {
                        logger.Error($"Something went wrong: {contextFeature.Error}");
                        await context.Response.WriteAsync(new DataModels.ErrInfo()
                        {
                            StatusCode = context.Response.StatusCode,
                            User = context.Response.HttpContext.User.ToString(),
                            Url = context.Request.GetDisplayUrl(),
                            Message = "Api Internal Server Error!", 
                        }.ToString());
                    }
                });
            });
        }
    }
}
