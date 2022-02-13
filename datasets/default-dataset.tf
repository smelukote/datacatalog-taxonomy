resource "google_bigquery_dataset" "my_dataset" {
  project                     = "involuted-woods-340900"
  dataset_id                  = "my_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  // default_table_expiration_ms = 3600000
  

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "my_table" {
  project                     = "involuted-woods-340900"
  deletion_protection         = false
  dataset_id                  = google_bigquery_dataset.my_dataset.dataset_id
  table_id                    = "my_table"

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "policyTags": {
      "names": []
    },
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  },
  {
    "name": "Account",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Account Number"
  },
  {
    "name": "SSN",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Social Security Number"
  },
  {
    "name": "Phone",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Phone Number"
  }
]
EOF

}