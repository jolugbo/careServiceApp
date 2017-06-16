using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareWebClient.class_holders
{
    public class ModelClasses
    {
    }
    // class handler for login 
    public class LoginDetails
    {
        public bool Valid { get; set; }
        public string Name { get; set; }
        public string LoginMessage { get; set; }
        public string CenterName { get; set; }
        public string CenterLocation { get; set; }
        public bool? SubscriptionStatus { get; set; }
        public bool? ActivateDeactivate { get; set; }
        public string StaffStrength { get; set; }
        public string FolderId { get; set; }
        public string CenterEmail { get; set; }
        public string ContactNumber { get; set; }
        public DateTime LastLoginDate { get; set; }
    }
   
    // class handler for registration
    public class RegDetails
    {
        public bool RegStatus { get; set; }
        public string RegMessage { get; set; }
    }
}