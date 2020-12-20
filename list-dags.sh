#!/bin/bash

# list available dags in airflow
gcloud composer environments run airflow --location europe-west1 list_dags
