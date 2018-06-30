using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestorantOtomasyonu.Datamodel;
using RestorantOtomasyonu.Helpers;

namespace RestorantOtomasyonu.Admin.Login
{
    public partial class Login1 : System.Web.UI.Page
    {
        HelperMethods hp = new HelperMethods();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session.Remove("KullaniciAdi");
                Session.Abandon();
            }
        }

        protected void BtnGonder_Click(object sender, EventArgs e)
        {
            string UserName = hp.InputCelar(txtUserName.Text);
            string Password = hp.Encrypt(txtPassword.Text);
            DateTime now = DateTime.Now;

            using (RestorantEntities db = new RestorantEntities())
            {
                User us = (from u in db.User
                           where u.Username == UserName && u.Password == Password
                           select u).FirstOrDefault();
                try
                {
                    if (us == null)
                    {
                        UserLog ul = new UserLog();
                        ul.UserName = UserName;
                        ul.UserLogText = UserName + " isimli kullanıcı adıyla " + hp.Decrypt(Password) + " şifresiyle sisteme giriş yapmaya çalıştı. ";
                        ul.Datetime = now;
                        ul.IpAddress = hp.getIPAdress();
                        ul.PcName = hp.getPcName();

                        db.UserLog.Add(ul);
                        db.SaveChanges();

                        ltrMessage.Text = "<div class=\"alert alert-warning\" role=\"alert\">Hatalı Giriş</div>";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    ltrMessage.Text = "<div class=\"alert alert-danger\" role=\"alert\">Hata Oluştu" + ex.Message.ToString() + "</ div >";
                    return;
                }

                if (us.IsFreeze == true)
                {
                    try
                    {
                        UserLog ul = new UserLog();
                        ul.UserName = UserName;
                        ul.UserLogText = UserName + " isimli kullanıcı adıyla " + hp.Decrypt(Password) + " şifresiyle sisteme giriş yapmaya çalıştı. Bu kullanıcı donduruldugu için giriş yapamadı";
                        ul.Datetime = now;
                        ul.IpAddress = hp.getIPAdress();
                        ul.PcName = hp.getPcName();

                        db.UserLog.Add(ul);
                        db.SaveChanges();

                        ltrMessage.Text = "<div class=\"alert alert-danger\" role=\"alert\">Kullanıcı Bloke Olmuştur. Lütfen Yöneticinizle iletişime geçin</ div >";
                        return;
                    }
                    catch (Exception ex)
                    {
                        ltrMessage.Text = "<div class=\"alert alert-danger\" role=\"alert\">Hata Oluştu" + ex.Message.ToString() + "</ div >";
                        return;
                    }

                }
                else
                {
                    try
                    {
                        UserLog ul = new UserLog();
                        ul.UserName = UserName;
                        ul.UserLogText = UserName + " isimli kullanıcı adıyla " + hp.Decrypt(Password) + " şifresiyle sisteme başarıyla giriş yaptı";
                        ul.Datetime = now;
                        ul.IpAddress = hp.getIPAdress();
                        ul.PcName = hp.getPcName();

                        db.UserLog.Add(ul);
                        db.SaveChanges();

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "clientscript", "document.getElementById('loader-wrapper').style.visibility = 'visible';", true);

                        ltrBgOpa.Text = "<div id=\"bgOpa\"></div>";

                        Session["KullaniciAdi"] = txtUserName.Text;
                        ltrMessage.Text = "<div style=\"clear:both;\"></div><div class=\"alert alert-success\" role=\"alert\">  Giriş Başarılı sayfaya yönlendiriliyorsunuz</ div ><div id =\"uyari\" class=\"alert alert-success\" role=\"alert\"></div><script>ysYonlendir(\"uyari\", \"../AdminPages/Default.aspx\", 3);</script>";

                    }
                    catch (Exception ex)
                    {

                        ltrMessage.Text = "<div class=\"alert alert-danger\" role=\"alert\">Hata Oluştu" + ex.Message.ToString() + "</ div >";
                        return;
                    }

                }

            }
        }
    }
}