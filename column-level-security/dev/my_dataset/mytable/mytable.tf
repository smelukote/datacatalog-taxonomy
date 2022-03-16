resource "google_bigquery_table" "mytable" {
  project                     = "involuted-woods-340900"
  dataset_id                  = "my_dataset"
  table_id                    = "mytable"
schema = <<EOF
[
  {
    "mode": "NULLABLE",
    "name": "id",
    "policyTags": {
     "names": ["projects/involuted-woods-340900/locations/us/taxonomies/5124523837670458460/policyTags/3363234234032465401"]
   },
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
