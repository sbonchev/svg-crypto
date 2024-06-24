
namespace Vsg.Services
{
    public class BianceCryptoException : Exception
    {
        public BianceCryptoException() : base() { }
        public BianceCryptoException(string message) : base(message) { }
        public BianceCryptoException(string message, Exception inner): base(message, inner)
        {
        }
    }
}
