using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Opis podsumowujący dla CustomIdentity
/// </summary>
public class CustomIdentity : System.Security.Principal.IIdentity
{
    private FormsAuthenticationTicket _ticket;

    public CustomIdentity(FormsAuthenticationTicket ticket)
    {
        _ticket = ticket;
    }

    public string AuthenticationType
    {
        get { return "Custom"; }
    }

    public bool IsAuthenticated
    {
        get { return true; }
    }

    public string Name
    {
        get { return _ticket.Name; }
    }

    public FormsAuthenticationTicket Ticket
    {
        get { return _ticket; }
    }

    public string DodatkowaFunkcjonalnosc
    {
        get
        {
            string userDataPieces = "userDataPieces";
            return userDataPieces;
        }
    }

    public string KolejnaFunkcjonalnosc
    {
        get
        {
            string userDataPieces = "otherDataPieces";
            return userDataPieces;
        }
    }
}