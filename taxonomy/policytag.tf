resource "google_data_catalog_taxonomy" "my_taxonomy" {
  provider               = google-beta
  region                 = "us"
  display_name           = "taxonomy_display_name"
  description            = "A collection of policy tags"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
  
}
# Three Different levels of security
resource "google_data_catalog_policy_tag" "high_policy_tag" {
  provider     = google-beta
  taxonomy     = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "High security"
  description  = "A policy tag normally associated with high security items"
 
}

resource "google_data_catalog_policy_tag" "medium_policy_tag" {
  provider     = google-beta
  taxonomy     = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "Medium security"
  description  = "A policy tag normally associated with medium security items"


}

resource "google_data_catalog_policy_tag" "low_policy_tag" {
  provider     = google-beta
  taxonomy     = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "Low security"
  description  = "A policy tag normally associated with low security items"
 
}

# This lets GCP know which user/group should be assigned the reader role
data "google_iam_policy" "finegrained" {
  binding {
    role = "roles/datacatalog.categoryFineGrainedReader"

    members = [
      "user:smgcp2023@gmail.com"
    ]
  }
}
# This resoure creates the binding between a specific policy tag and the user/group assigned.
resource "google_data_catalog_policy_tag_iam_policy" "policy" {
  provider = google-beta
  #policy_tag = google_data_catalog_policy_tag.high_policy_tag.name
  #policy_tag = google_data_catalog_policy_tag.medium_policy_tag.name
  policy_tag  = google_data_catalog_policy_tag.low_policy_tag.name
  policy_data = data.google_iam_policy.finegrained.policy_data
}