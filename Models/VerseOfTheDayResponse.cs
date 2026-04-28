using System.Text.Json.Serialization;

namespace DuckPortfolio.BibleApi.Models;

public sealed record VerseOfTheDayResponse(
    int Day,
    [property: JsonPropertyName("passage_id")] string PassageId);
