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
    
    public partial class care_center_kiddies
    {
        public care_center_kiddies()
        {
            this.care_center_invoice = new HashSet<care_center_invoice>();
            this.care_center_kiddies_activity = new HashSet<care_center_kiddies_activity>();
            this.care_photo_details = new HashSet<care_photo_details>();
        }
    
        public System.Guid care_kiddie_id { get; set; }
        public Nullable<System.Guid> care_center_id { get; set; }
        public Nullable<System.Guid> care_parent_id { get; set; }
        public string care_kiddie_lastname { get; set; }
        public string care_kiddie_firstname { get; set; }
        public string care_kiddie_othername { get; set; }
        public Nullable<System.DateTime> care_kiddie_DOB { get; set; }
        public string care_kiddie_blood_group { get; set; }
        public string care_kiddie_genotype { get; set; }
        public string care_kiddie_profile_photo_path { get; set; }
        public string care_kiddie_gender { get; set; }
    
        public virtual ICollection<care_center_invoice> care_center_invoice { get; set; }
        public virtual ICollection<care_center_kiddies_activity> care_center_kiddies_activity { get; set; }
        public virtual care_center_parents care_center_parents { get; set; }
        public virtual care_center_setup_tab care_center_setup_tab { get; set; }
        public virtual ICollection<care_photo_details> care_photo_details { get; set; }
    }
}
