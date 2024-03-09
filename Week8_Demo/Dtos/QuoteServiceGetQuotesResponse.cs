using Mobile_Application.Models;

namespace Mobile_Application.Dtos;

public class QuoteServiceGetQuotesResponse
{
    public int Count { get; set; }
    public int TotalCount { get; set; }
    public int Page { get; set; }
    public int TotalPages { get; set; }
    public int LastItemIndex { get; set; }
    public List<QuoteModel> Results { get; set; }
}