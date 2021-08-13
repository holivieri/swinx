using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Swinx.APIEntities;
using Swinx.APIModels;
using Swinx.APIRepositories;
using Swinx.APIServices;
using Swinx.APIUtilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace Swinx.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAutoMapper(typeof(Startup));

            services.AddDataProtection();
            services.AddControllers(
                    options => options.Conventions.Add(new SwaggerGroupByVersion())
                );
            services.AddHttpClient();
            services.AddDbContext<swinxDbContext>(options =>
                   options.UseSqlServer(Configuration["ConnectionStrings:swinxDb"]));
            services.AddIdentity<User, IdentityRole>()
                .AddEntityFrameworkStores<swinxDbContext>()
                .AddDefaultTokenProviders();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(
                options =>
                 options.TokenValidationParameters = new TokenValidationParameters
                 {
                     ValidateIssuer = false,
                     ValidateAudience = false,
                     ValidateLifetime = true,
                     ValidateIssuerSigningKey = true,
                     IssuerSigningKey = new SymmetricSecurityKey(
                            Encoding.UTF8.GetBytes(Configuration["jwt:key"])),
                     ClockSkew = TimeSpan.Zero
                 });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("isAdmin", policy => policy.RequireClaim("isAdmin"));
            });

            services.AddCors(opt =>
            {
                opt.AddPolicy("CorsPolicy", policy =>
                {
                    policy.AllowAnyMethod()
                            .AllowAnyOrigin()
                            .AllowAnyHeader()
                            .WithExposedHeaders(new string[] { "totalRecordsCount" });
                });
            });
            services.AddTransient<ISwinxDbContext, swinxDbContext>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IUsersRepository, UserRepository>();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo {    Title = "Swinx API", 
                                                        Version = "v1", 
                                                        Description= "Web Api for Swinx"});
                c.SwaggerDoc("v2", new OpenApiInfo {    Title = "Swinx API", 
                                                        Version = "v2",
                                                        Description = "Web Api for Swinx"
                });

                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme { 
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            }
                        },
                        new string[]{}
                    }
                    
                });

            });
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(c => {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swinx v1");
                c.SwaggerEndpoint("/swagger/v2/swagger.json", "Swinx v2");
            });


            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors("CorsPolicy");

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
            app.UseAuthentication();

        }
    }
}
