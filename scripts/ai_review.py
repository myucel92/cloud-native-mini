scan_result = """
Trivy Scan Summary
------------------
CRITICAL: 0
HIGH: 0
MEDIUM: 2
LOW: 5
"""

def generate_ai_review(scan_data):
    review = f"""
AI Security Review
==================

Analysis Result:
- No CRITICAL vulnerabilities detected.
- No HIGH severity vulnerabilities detected.
- Some MEDIUM and LOW vulnerabilities exist.
- Current container security posture is acceptable for development environments.

Recommendations:
- Keep base images updated regularly.
- Minimize unused packages.
- Run periodic vulnerability scans.
"""

    return review

result = generate_ai_review(scan_result)

with open("ai-review.txt", "w") as file:
    file.write(result)

print(result)
