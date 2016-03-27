using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web_Lab_1.Startup))]
namespace Web_Lab_1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
