<%@ Application Language="C#" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">

    //void Application_OnPostAuthenticateRequest(object sender, EventArgs e)
    //{
    //    IPrincipal usr = HttpContext.Current.User;

    //    if(usr.Identity.IsAuthenticated && usr.Identity.AuthenticationType == "Forms")
    //    {
    //        FormsIdentity fIdent = usr.Identity as FormsIdentity;

    //        CustomIdentity ci = new CustomIdentity(fIdent.Ticket);

    //        CustomPrincipal p = new CustomPrincipal(ci);

    //        HttpContext.Current.User = p;
    //        Thread.CurrentPrincipal = p;
    //    }
    //}
    //stare ustwienia uwieżytelniania. Zakomendowane w celu sprawdzenia czy przez nie działało przypisywanie ról

    void Application_Start(object sender, EventArgs e)
    {
        // Kod uruchamiany podczas uruchamiania aplikacji

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Kod uruchamiany podczas zamykania aplikacji

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Kod uruchamiany po wystąpieniu nieobsługiwanego błędu

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Kod uruchamiany w momencie rozpoczynania nowej sesji

    }

    void Session_End(object sender, EventArgs e)
    {
        // Kod uruchamiany w momencie kończenia sesji. 
        // Uwaga: zdarzenie Session_End jest wywoływane tylko wtedy, gdy tryb stanu sesji
        // jest ustawiony na InProc w pliku Web.config. Jeśli tryb sesji jest ustawiony na StateServer 
        // lub SQLServer, zdarzenie nie jest wywoływane.

    }

</script>
