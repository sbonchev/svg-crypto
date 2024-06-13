using System.Globalization;
using System.Text.Json.Serialization;
using System.Text.Json;

namespace Vsg.DataModels.Converters
{
	public class StringToDecimalConverter : JsonConverter<decimal>
	{
		public override decimal Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
		{
			if (reader.TokenType == JsonTokenType.String)
			{
				var stringValue = reader.GetString();
				if (decimal.TryParse(stringValue, NumberStyles.Number, CultureInfo.InvariantCulture, out var value))
				{
					return value;
				}
				throw new JsonException($"Unable to convert \"{stringValue}\" to {typeToConvert}.");
			}

			return reader.GetDecimal();
		}

		public override void Write(Utf8JsonWriter writer, decimal value, JsonSerializerOptions options)
		{
			writer.WriteStringValue(value.ToString(CultureInfo.InvariantCulture));
		}
	}
}
