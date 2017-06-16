using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace careServiceApp.class_holders
{
    public class ModelClasses
    {
    }

    // response handler for login 
    public class LoginDetails
    {
        public Guid  CareCenterId { get; set; }
        public bool   Valid { get; set; }
        public string Name { get; set; }
        public string LoginMessage { get; set; }
        public string CenterName { get; set; }
        public string CenterLocation { get; set; }
        public bool?  SubscriptionStatus { get; set; }
        public bool?  ActivateDeactivate { get; set; }
        public string StaffStrength { get; set; }
        public string FolderId { get; set; }
        public string CenterEmail { get; set; }
        public string ContactNumber { get; set; }
        public string ImgPath { get; set; }
        public string Website { get; set; }
        public byte[] Logo  { get; set; }
        public DateTime? LastLoginDate { get; set; }
        public Payment[] TransDetails { get; set; }
    }
    
    // response to handle care center kiddies detail response
    public class CareKiddieDetails
    {
        public Guid         CareCenterId        { get; set; }
        public Guid         CarekiddieId { get; set; }
        public string       CarekiddieLastName  { get; set; }
        public string       CarekiddieFirstName { get; set; }
        public string       CarekiddieOtherName { get; set; }
        public DateTime ?   CarekiddieDob       { get; set; }
        public string       CarekiddieBloodGroup { get; set; }
        public string       CarekiddieGenotype  { get; set; }
        public string       CarekiddieGender { get; set; }
        public string       CarekiddiePhotoPath { get; set; }
        public Payment[]    PaymentDetails      { get; set; }
        public Parent       Parents             { get; set; }
        public Activities[] Activities          { get; set; }
        public Pictures[]   Pictures            { get; set; }
    }

    //response handler for payment
    public class Payment
    {
        public string   PaymentDescription { get; set; }
        public decimal? PaymentInvoiced    { get; set; }
        public string   ReceiptNo          { get; set; }
        public decimal? PaymentMade        { get; set; }
        public string   PaymenType         { get; set; }
        public DateTime? PaymentDate        { get; set; }
    }

    //response handler for Parent
    public class Parent
    {
        public Guid   ParentId        { get; set; }
        public string ParentLoginId   { get; set; }
        public string ParentFullName  { get; set; }
        public string ParentContactNo { get; set; }
        public string ParentEmail     { get; set; }
        public string Occupation      { get; set; }
    }
    
    //response handler for Pictures
    public class Activities
    {
        public Guid?     ActivityId                { get; set; }
        public Guid      KiddiesActivityId         { get; set; }
        public string    KiddiesActivityNotes      { get; set; }
        public string    KiddiesActivityImagePath  { get; set; }
        public DateTime? KiddiesActivityDateUpdated { get; set; }
        public string    ActivityTitle             { get; set; }
        public string    ActivityIconPath          { get; set; }
    }

    //response handler for Pictures
    public class Pictures
    {
        public Guid     PhotoId          { get; set; }
        public string   PhotoPath        { get; set; }
        public string   PhotoDescription { get; set; }
        public DateTime? DateCaptured    { get; set; }
    }
    
    // response handler for registration
    public class RegDetails
    {
        public bool RegStatus { get; set; }
        public string RegMessage { get; set; }
    }

    //response handler for Staffs
    public class Staffs
    {
        public Guid?    CareStaffId { get; set; }
        public string   CareStaffLoginName { get; set; }
        public string   Gender { get; set; }
        public string   CareStaffName { get; set; }
        public string   CareStaffContactNumber { get; set; }
        public string   CareStaffRatings { get; set; }
        public DateTime? DateRegistered { get; set; }
        public bool?     CareStaffEmploymentStatus { get; set; }
        public string   CareStaffPassword { get; set; }
        public string   CareStaffEmail { get; set; }

    }
    
    // response handler for profileUpdate
    public class UpdateDetails
    {
        public bool UpdateStatus { get; set; }
        public string UpdateMessage { get; set; }
    }
}