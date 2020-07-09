using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SP_TUT.Startup))]
namespace SP_TUT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
