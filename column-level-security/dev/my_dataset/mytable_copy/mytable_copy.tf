resource "google_bigquery_table" "mytable_copy" {
  project                     = "involuted-woods-340900"
  dataset_id                  = "my_dataset"
  table_id                    = "mytable_copy"

schema = <<EOF
[
  {
    "mode": "NULLABLE",
    "name": "id",
    "policyTags": {
     "names": ["projects/involuted-woods-340900/locations/us/taxonomies/687991776380433922/policyTags/2275894906795300867"]},
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "first_name",
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "last_name",
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "dob",
    "type": "DATE"
  },
  {
    "fields": [
      {
        "mode": "NULLABLE",
        "name": "status",
        "type": "STRING"
      },
      {
        "mode": "NULLABLE",
        "name": "address",
        "type": "STRING"
      },
      {
        "mode": "NULLABLE",
        "name": "city",
        "type": "STRING"
      },
      {
        "mode": "NULLABLE",
        "name": "state",
        "type": "STRING"
      },
      {
        "mode": "NULLABLE",
        "name": "zip",
        "type": "STRING"
      },
      {
        "mode": "NULLABLE",
        "name": "numberOfYears",
        "type": "STRING"
      }
    ],
    "mode": "REPEATED",
    "name": "addresses",
    "type": "RECORD"
  }
]
EOF
}