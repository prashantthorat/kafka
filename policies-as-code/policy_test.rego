package istio.authz


test_allow {
    allow with input as {
    "attributes": {
        "request": {
            "http": {
                "headers": {
                    "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOThlNTczMS05ZjUwLTQ5NzItYTVhNC04N2E4MWE0NDFiYjUiLCJuYW1lIjoiSm9obiBEb2UiLCJpYXQiOjE1MTYyMzkwMjJ9.Vlqi_JV-aZYVs_DWGUnZsgZFPXYuQISTo2oUQQ5oLEc",
                },
                "method": "POST",
                "path": "/comidentityas/v1/users/d98e5731-9f50-4972-a5a4-87a81a441bb5/password/challenges"
            }
        },
    },
    "parsed_path": [
        "comidentityas",
        "v1",
        "users",
        "d98e5731-9f50-4972-a5a4-87a81a441bb5",
        "password",
        "challenges"
    ],
    "parsed_query": {}
}
}


test_allow_invalid_profile_id {
    allow with input as {
    "attributes": {
        "request": {
            "http": {
                "headers": {
                    "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOThlNTczMS05ZjUwLTQ5NzItYTVhNC04N2E4MWE0NDFiYjUiLCJuYW1lIjoiSm9obiBEb2UiLCJpYXQiOjE1MTYyMzkwMjJ9.Vlqi_JV-aZYVs_DWGUnZsgZFPXYuQISTo2oUQQ5oLEc",
                },
                "method": "POST",
                "path": "/comidentityas/v1/users/d98e5731-9f50-4972-a5a4-87a81a441bb51/password/challenges"
            }
        },
    },
    "parsed_path": [
        "comidentityas",
        "v1",
        "users",
        "d98e5731-9f50-4972-a5a4-87a81a441bb5",
        "password",
        "challenges"
    ],
    "parsed_query": {}
}
}