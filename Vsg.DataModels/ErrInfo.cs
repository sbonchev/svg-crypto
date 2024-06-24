using System.Text.Json;


namespace Vsg.DataModels
{
    /// <summary>
    /// Keeps possible http error details info.
    /// </summary>
    public class ErrInfo
    {
        public int StatusCode { get; set; }
        public string? Message { get; set; }

        public string? User { get; set; }

        public string? Url { get; set; }
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
    }
}
