using System.Collections.Concurrent;
using AVStaffing.Models;
using AVStaffing.Models.Entities;

namespace AVStaffing.Infrastructure
{
    public class LoadedPermissions
    {
        public static readonly ConcurrentDictionary<string, Permission> Permissions = new ConcurrentDictionary<string, Permission>();
        public static readonly ConcurrentDictionary<string, Portfolio> Portfolios = new ConcurrentDictionary<string, Portfolio>();
    }
}