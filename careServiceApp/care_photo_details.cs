//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace careServiceApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class care_photo_details
    {
        public System.Guid care_center_photo_id { get; set; }
        public Nullable<System.Guid> care_kiddie_id { get; set; }
        public string care_center_photo_path { get; set; }
        public Nullable<System.DateTime> care_photo_date_captured { get; set; }
        public string care_photo_description { get; set; }
    
        public virtual care_center_kiddies care_center_kiddies { get; set; }
    }
}
