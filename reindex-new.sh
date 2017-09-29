#! /bin/bash
#
# Unfinished script to reindex data between indexes.
#

source "./indexUtil.sh"

# list of fields whose data we want to copy
documentFieldList=(
    "id"
    "tenant_id"
    "cons_id"
    "cons_name.first"
    "cons_name.middle"
    "cons_name.last"
    "email_opt_in_status"
    "email.address"
    "email.type"
    "email.do_not_email"
    "email.is_active"
    "address.address_lines"
    "address.locality"
    "address.sub_administrative_area"
    "address.administrative_area"
    "address.postal_code"
    "address.country"
    "address.do_not_mail"
    "address.preferred"
    "address.type"
    "type"
    "active"
    "membership.level_id"
    "membership.status"
    "membership.start_date"
    "membership.expiration_date"
    "cong_dist_id"
    "state_senate_dist_id"
    "state_house_dist_id"
    "home_municipality"
    "municipal_id"
    "municipal_dist_id"
    "donor_status"
    "email_status"
    "sustained_giving.status"
    "sustained_giving.monthly_amount"
    "sustained_giving.start_date"
    "sustained_giving.planned_end_date"
    "last_transaction_amount"
    "transaction_totals.prev_year_total_year"
    "transaction_totals.previous_year_total"
    "transaction_totals.current_year_to_date_total"
    "transaction_totals.lifetime_total"
    "creation_date"
)

documentFields=$(sed -E 's/^| /&-/g' <<<"$documentFieldList")
echo $documentFields

buildElasticSearchReindexUrl elasticSearchUrl $environment
echo "Elastic search url: $elasticSearchUrl"

