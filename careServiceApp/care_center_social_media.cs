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
    
    public partial class care_center_social_media
    {
        public System.Guid care_center_social_media_id { get; set; }
        public Nullable<System.Guid> care_center_id { get; set; }
    
        public virtual care_center_setup_tab care_center_setup_tab { get; set; }
    }
}
