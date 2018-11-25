resource "aws_route53_record" "alias_route53_record" {
  zone_id = "${var.route53_zone_id}" # Replace with your zone ID
  name    = "anmolposts.com" # Replace with your name/domain/subdomain
  type    = "A"

  alias {
    name                   = "${aws_alb.main.dns_name}"
    zone_id                = "${aws_alb.main.zone_id}"
    evaluate_target_health = true
  }
}
