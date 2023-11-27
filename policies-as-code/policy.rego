package istio.authz

default allow := false

import input.attributes.request.http as http_request

segments := split(http_request.path, "/")

allow := true {
	has_profile_id
	profile_id := segments[4]
	profile_id == claims.sub
} else := true {
	not has_profile_id
} else := error

has_profile_id := true {
	startswith(http_request.path, "/comidentityas/v1/users")
	http_request.path != "/comidentityas/v1/users/me/password"
	count(segments) > 4
} 

claims := payload {
	[_, payload, _] := io.jwt.decode(bearer_token)
}

bearer_token := t {
	# Bearer tokens are contained inside of the HTTP Authorization header. This rule
	# parses the header and extracts the Bearer token value. If no Bearer token is
	# provided, the `bearer_token` value is undefined.
	v := http_request.headers.authorization
	startswith(v, "Bearer ")
	t := substring(v, count("Bearer "), -1)
}

# time.format is not supported in v 0.41.0 so we have added time in epoch as of now
current_time = format_int(floor(time.now_ns()/1000000), 10)

error_body := concat("", [ "{ \"timestamp\": \"", current_time ,"\",\"status\": 403, \"instance\": \"", http_request.path, "\", \"detail\": \"Do not have permission to access this resource \", \"subDetails\": [],\"type\": \"about:blank\", \"code\": \"Forbidden\", \"title\": \"Forbidden\"}"])

error := {
	"allowed": false,
	"headers": {"Content-Type": "application/json"},
	"body": error_body,
	"http_status": 403,
}
