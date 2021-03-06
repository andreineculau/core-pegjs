/*
 * Literate HTTP (curl)
 *
 * Parse output of
 * curl -s -v ... 2>&1 | sed '/^[star]/d' | sed '/data not shown/d'
 *
 * @append for-get/literate-http.pegjs
 * @append ietf/draft-ietf-httpbis-p1-messaging.pegjs
 * @append ietf/rfc3986-uri.pegjs
 * @append ietf/rfc5234-core-abnf.pegjs
 */

/* OVERRIDE */

litHTTP_ticks_start
  = litHTTP_ticks "curl"? (!EOL .)*

litHTTP_request_line
  = litHTTP_request_line_mark method SP litHTTP_request_target (SP HTTP_version) EOL

litHTTP_request_body_separator
  = litHTTP_request_mark EOL

litHTTP_status_line
  = litHTTP_response_mark (HTTP_version SP) status_code (SP reason_phrase) EOL

litHTTP_response_body_separator
  = litHTTP_response_mark EOL

litHTTP_request_line_mark
  = ("*" (!EOL .)+ EOL)* litHTTP_request_mark

litHTTP_request_mark
  = ">" OWS

litHTTP_response_mark
  = "<" OWS
