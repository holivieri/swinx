using Swinx.APIDTOs;
using System.Linq;


namespace Swinx.APIUtilities
{
    public static class IQueryableExtensions
    {
        public static IQueryable<T> Paginate<T> (this IQueryable<T> queryable, PaginationDTO paginationDTO)
        {
            return queryable
                        .Skip((paginationDTO.currentPage - 1) * paginationDTO.recordsByPage)
                        .Take(paginationDTO.recordsByPage);
        }
    }
}
