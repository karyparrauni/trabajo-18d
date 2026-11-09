#!/bin/bash
set -uo pipefail

echo "=========================================================="
echo "  VERIFICACIÓN Y CARGA LOCAL A DEFECTDOJO API v2 (TP18)"
echo "=========================================================="

DEFECTDOJO_URL="${DEFECTDOJO_URL:-http://localhost:8080}"
API_KEY="${DEFECTDOJO_API_KEY:-tu_token_aqui}"
PRODUCT_NAME="${PRODUCT_NAME:-Notes App}"
ENGAGEMENT_NAME="${ENGAGEMENT_NAME:-CI/CD Automated Security Audits}"

import_scan() {
  local SCAN_TYPE="$1"
  local FILE_PATH="$2"
  if [ -f "$FILE_PATH" ]; then
    echo "  [+] Enviando $SCAN_TYPE ($FILE_PATH) a DefectDojo..."
    RESPONSE=$(curl -s -X POST "$DEFECTDOJO_URL/api/v2/import-scan/" \
       -H "Authorization: Token $API_KEY" \
       -F "product_name=$PRODUCT_NAME" \
       -F "engagement_name=$ENGAGEMENT_NAME" \
       -F "scan_type=$SCAN_TYPE" \
       -F "auto_create_context=true" \
       -F "file=@$FILE_PATH")

    if echo "$RESPONSE" | grep -q "scan_type"; then
      echo "      [OK] Importación exitosa"
    else
      echo "      [FAIL] Error en importación: $RESPONSE"
    fi
  else
    echo "  [WARN] Archivo $FILE_PATH no encontrado. Genera el reporte previo."
  fi
}

import_scan "Semgrep JSON Report" "reports-json/semgrep-results.json"
import_scan "Trivy Scan" "reports-json/trivy-container-results.json"
import_scan "Gitleaks Scan" "reports-json/gitleaks-report.json"

echo "=========================================================="
