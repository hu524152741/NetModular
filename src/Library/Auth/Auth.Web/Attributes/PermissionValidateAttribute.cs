﻿using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using Nm.Lib.Auth.Abstractions;
using Nm.Lib.Utils.Core.Enums;
using Nm.Lib.Utils.Core.Extensions;

namespace Nm.Lib.Auth.Web.Attributes
{
    /// <summary>
    /// 权限验证
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true)]
    public class PermissionValidateAttribute : AuthorizeAttribute, IAuthorizationFilter
    {
        /// <summary>
        /// 账户类型
        /// </summary>
        public AccountType[] AccountTypes { get; set; }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            //排除匿名访问
            if (context.ActionDescriptor.EndpointMetadata.Any(m => m.GetType() == typeof(AllowAnonymousAttribute)))
                return;

            //未登录
            var loginInfo = context.HttpContext.RequestServices.GetService<ILoginInfo>();
            if (loginInfo == null || loginInfo.AccountId.IsEmpty())
            {
                context.Result = new ChallengeResult();
                return;
            }

            //排除通用接口
            if (context.ActionDescriptor.EndpointMetadata.Any(m => m.GetType() == typeof(CommonAttribute)))
                return;

            //验证方式：如果设置了AccountTypes属性，则只要当前登录账户的类型在列表当中就可以访问，否则，需要通过验证权限判断是否能访问
            if (AccountTypes != null && AccountTypes.Any() && AccountTypes.Contains(loginInfo.AccountType))
            {
                return;
            }

            var httpMethod = (HttpMethod)Enum.Parse(typeof(HttpMethod), context.HttpContext.Request.Method);
            var handler = context.HttpContext.RequestServices.GetService<IPermissionValidateHandler>();
            if (!handler.Validate(context.ActionDescriptor.RouteValues, httpMethod))
            {
                //无权访问
                context.Result = new ForbidResult();
            }
        }
    }
}
