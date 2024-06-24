using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Vsg.DataModels
{
    public class CryptoBase
    {
        /// <summary>
        /// Db auto-increment field
        /// </summary>
        [Required]
        [JsonIgnore]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IdAvg { get; set; }
    }
}
