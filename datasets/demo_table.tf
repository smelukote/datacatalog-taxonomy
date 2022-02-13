resource "google_bigquery_table" "demo_table" {
  project                     = "involuted-woods-340900"
  dataset_id                  = "my_dataset"
  table_id                    = "demo_table"

    schema = <<EOF
[

  {
    "mode": "NULLABLE",
    "name": "FirstName",
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "LastName",
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "Address",
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "SSN",
    "policyTags": {
     "names": ["projects/involuted-woods-340900/locations/us/taxonomies/4014323489708035566/policyTags/7553333527779386538"]
   },
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "PhoneNumber",
    "policyTags": {
     "names": []
   },
    "type": "STRING"
  },
  {
    "mode": "NULLABLE",
    "name": "ZipCode",
    "type": "INTEGER"
  }
]
EOF
}