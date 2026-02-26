package policy

import future.keywords.if

# 1. Define the expected predicateSlugs
expected_predicate_slugs := {"approval", "slsa-provenance", "spdx-document"}

# 2. Extract the actual slugs from the provided input format
# This uses a comprehension to create a set of slugs found in the array
found_predicate_slugs := { slug |
    some ev in input.result.evidence
    slug := ev.predicateSlug
}

# 3. Logic to determine missing and found items
found := [slug | slug := found_predicate_slugs[_]]
not_found := [slug |
    some slug in expected_predicate_slugs
    not found_predicate_slugs[slug]
]

# 4. Final approval logic
# It is approved if the set of expected slugs is a subset of the found slugs
approved if {
    count(expected_predicate_slugs - found_predicate_slugs) == 0
}

# 5. Formatted Output
output := {
    "found": found,
    "not_found": not_found,
    "approved": approved
}

# 6. Defaults to ensure the policy always returns a valid structure
default approved := false
default output := {"found": [], "not_found": [], "approved": false}