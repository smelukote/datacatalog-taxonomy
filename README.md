# datacatalog-taxonomy
## Command Ref"
"policyTags": {
     "names": ["projects/project-id/locations/location/taxonomies/taxonomy-id/policyTags/policytag-id"]
   }

### Get the JSON format for a bq table ###
bq show --schema --format=prettyjson \
   project-id:dataset.table > schema.json
### update the table with taxonomy policy
"policyTags": {
     "names": ["projects/project-id/locations/location/taxonomies/taxonomy-id/policyTags/policytag-id"]
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


