using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Vsg.Web.Api
{
    public class AuthJwt
    {
        private readonly IConfiguration _config;

        public AuthJwt(IConfiguration config)
        {
            _config = config;
        }

        internal string GetJwt {
            get 
            {
                var claimList = new List<Claim>
                {
                    new (ClaimTypes.NameIdentifier, _config["JWT:Id"]??""),
                    new (ClaimTypes.Name, _config["JWT:Name"]??""),
                    new (ClaimTypes.Email, _config["JWT:Email"]??"")
                };
                var signKey = new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:JWT_Secret"] ?? "")), 
                                                     SecurityAlgorithms.HmacSha256Signature);
                var token = new JwtSecurityToken(null, null, claimList,  DateTime.UtcNow, 
                                                 DateTime.UtcNow.AddDays(30), signKey);

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
        }

    }
}
