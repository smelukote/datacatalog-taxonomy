### Datacatalog-taxonomy Policy - Implementations using Terraform on big query tables

#### Step 1. Importing state file

# 1. terraform import google_bigquery_table.demo_table involuted-woods-340900/my_dataset/my_table

Before importing this resource, please create its configuration in the root module. For example:

resource "google_bigquery_table" "demo_table" {
}

#### Step 2. create a sample TF file demo_table.tf ####
demo_table.tf
resource "google_bigquery_table" "demo_table" {
  # (resource arguments)
}
############# re-run the state import command
#### Step 3.
terraform import google_bigquery_table.demo_table involuted-woods-340900/my_dataset/my_table
google_bigquery_table.demo_table: Importing from ID "involuted-woods-340900/my_dataset/my_table"...
google_bigquery_table.demo_table: Import prepared!
  Prepared google_bigquery_table for import
google_bigquery_table.demo_table: Refreshing state... [id=projects/involuted-woods-340900/datasets/my_dataset/tables/my_table]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

#### Step4. Verify the imported state
$terraform state list
data.google_iam_policy.finegrained
google_bigquery_dataset.my_dataset
google_bigquery_table.demo_table
google_bigquery_table.my_table
google_data_catalog_policy_tag.high_policy_tag
google_data_catalog_policy_tag.low_policy_tag
google_data_catalog_policy_tag.medium_policy_tag
google_data_catalog_policy_tag_iam_policy.policy
google_data_catalog_taxonomy.my_taxonomy

##########

#### Step5. Get the JSON format for a bq table ###
bq show --schema --format=prettyjson \
   involuted-woods-340900:my_dataset.demo_table > schema.json

#### Step6.
paste dataset json contents to demo_table.tf

#### update demo_table.tf with project id, dataset id and table id

resource "google_bigquery_table" "demo_table" {
  project                     = "involuted-woods-340900"
  dataset_id                  = "my_dataset"
  table_id                    = "demo_table"
#### Stpe7
## update demo_table.tf with imported JSON contents
   schema = <<EOF
[
   ...
   ...
]
}


#### update demo_table.tf with taxonomy  policy
## ex : 
"policyTags": {
     "names": ["projects/project-id/locations/location/taxonomies/taxonomy-id/policyTags/policytag-id"]
   }
#### Step 8. execute terraform apply to implement new policy or remove an existing policy.
terrform apply
#################################################################################

# Other BQ commands #####

### Get the JSON format for a bq table ###
bq show --schema --format=prettyjson \
   project-id:dataset.table > schema.json
### update the table with taxonomy policy
"policyTags": {
     "names": ["projects/involuted-woods-340900/locations/us/taxonomies/5124523837670458460/policyTags/3363234234032465401"]
   }
### Run bq update to push the policy to the bq table
bq update \
   project-id:dataset.table schema.json
bq update \
   involuted-woods-340900:my_dataset.my_table schema.json

### Verify the updata
check bq table for Policy Tags implemented.

## remove Tag
## edit schema.json and remove policy entry
"policyTags": {
      "names": []
}
#### Run bqupdate to implement the change
bq update    involuted-woods-340900:my_dataset.my_table schema.json
Table 'involuted-woods-340900:my_dataset.my_table' successfully updated.


