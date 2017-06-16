using System;

namespace careServiceApp
{
    public class ClientSetupModel
    {
        public System.Guid CareCenterId { get; set; }
        public string CareCenterLoginName { get; set; }
        public string CareCenterName { get; set; }
        public string CareCenterLocation { get; set; }
        public Nullable<bool> CareCenterSubscriptionStatus { get; set; }
        public string CareCenterPassword { get; set; }
        public Nullable<System.DateTime> CareCenterDateRegistered { get; set; }
        public Nullable<bool> CareCenterActivateDeactivate { get; set; }
        public string CareCenterStaffStrength { get; set; }
        public Nullable<System.Guid> CareCenterFolderId { get; set; }
    }
}