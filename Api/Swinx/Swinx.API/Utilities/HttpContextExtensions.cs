﻿using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Swinx.APIUtilities
{
    public static class HttpContextExtensions
    {
        public async static Task InsertParameterPaginationInHeader<T>(this HttpContext httpContext,
            IQueryable<T> queryable)
        {
            if(httpContext == null) { throw new ArgumentNullException(nameof(httpContext)); }

            double quantity = await queryable.CountAsync();
            httpContext.Response.Headers.Add("totalRecordsCount", quantity.ToString());

        }
    }
}
