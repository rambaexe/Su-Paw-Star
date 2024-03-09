using Mobile_Application.Models;

namespace Mobile_Application.Interfaces
{
    public interface IDatabaseService
    {
        Task<List<QuoteModel>> GetQuotes();
        Task<int> SaveQuote(QuoteModel quoteModel);
        Task<int> EditQuote(QuoteModel quoteModel);
        Task<int> RemoveQuote(string quoteModelId);
    }
}