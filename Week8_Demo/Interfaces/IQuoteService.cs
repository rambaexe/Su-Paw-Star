using Mobile_Application.Models;

namespace Mobile_Application.Interfaces
{
    public interface IQuoteService
    {
        public Task<List<Models.QuoteModel>> GetQuotes();
        public Task<QuoteModel?> GetQuote();
        public Task<bool> SaveQuote(QuoteModel model);

    }
}