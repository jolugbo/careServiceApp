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
    
    public partial class care_center_subscription_type
    {
        public care_center_subscription_type()
        {
            this.care_center_subscription_details_table = new HashSet<care_center_subscription_details_table>();
            this.care_center_subscription_features = new HashSet<care_center_subscription_features>();
        }
    
        public System.Guid subscription_type_id { get; set; }
        public string subscription_name { get; set; }
        public Nullable<int> subscription_duration { get; set; }
        public Nullable<int> subscription_value { get; set; }
    
        public virtual ICollection<care_center_subscription_details_table> care_center_subscription_details_table { get; set; }
        public virtual ICollection<care_center_subscription_features> care_center_subscription_features { get; set; }
    }
}
